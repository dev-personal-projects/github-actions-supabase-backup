# Scheduled Backup Reliability & Efficiency Plan

## 📋 Overview

This document outlines improvements to ensure the scheduled backup system runs efficiently and reliably at the configured time, with proper error handling, monitoring, and recovery mechanisms.

## 🎯 Goals

1. **Reliability**: Scheduled backups run consistently at the configured time
2. **Error Resilience**: Handle failures gracefully with proper retry and recovery
3. **Monitoring**: Clear visibility into backup status and failures
4. **Efficiency**: Optimize execution time and resource usage
5. **Recovery**: Automatic recovery from transient failures

## 🔍 Current Issues Identified

### Issue 1: Cron Schedule Still in Testing Mode
- **Problem**: Schedule is set to `"35 8 * * *"` (testing time) instead of production time
- **Impact**: Backups run at wrong time
- **Fix**: Update to production schedule `"16 8 * * *"` (08:16 UTC daily)

### Issue 2: No Error Isolation Between Branches
- **Problem**: If triggering backup on `main` fails, it throws error and prevents `dev` backup from being triggered
- **Impact**: One branch failure blocks the other branch
- **Fix**: Make each branch trigger independent with proper error handling

### Issue 3: No Retry Logic in Trigger Workflow
- **Problem**: If GitHub API call fails (rate limit, network issue), workflow fails immediately
- **Impact**: Transient failures cause permanent backup failure
- **Fix**: Add retry logic with exponential backoff

### Issue 4: No Verification of Backup Start
- **Problem**: Trigger workflow doesn't verify that backup workflow actually started
- **Impact**: Silent failures go undetected
- **Fix**: Add verification step to confirm backup workflow was triggered

### Issue 5: No Timeout Handling
- **Problem**: If backup workflow hangs, no timeout mechanism
- **Impact**: Resources wasted, no clear failure indication
- **Fix**: Add timeout configuration and handling

### Issue 6: Token Validation
- **Problem**: No validation that `WORKFLOW_TRIGGER_TOKEN` is valid before use
- **Impact**: Invalid token causes silent failure
- **Fix**: Add token validation step

### Issue 7: No Concurrency Control for Scheduled Backups
- **Problem**: Scheduled backups might conflict with manual/push-triggered backups
- **Impact**: Potential race conditions or duplicate backups
- **Fix**: Ensure concurrency control works for all trigger types

### Issue 8: Limited Error Reporting
- **Problem**: Errors are logged but not easily visible or actionable
- **Impact**: Failures go unnoticed
- **Fix**: Add better error reporting and notifications

## 🛠️ Proposed Improvements

### Improvement 1: Production Schedule Configuration

**Action**: Update cron schedule to production time

**Current**:
```yaml
- cron: "35 8 * * *" # Testing time
```

**Proposed**:
```yaml
- cron: "16 8 * * *" # Daily at 08:16 UTC
```

**Additional**: Make schedule configurable via environment variable or workflow input

---

### Improvement 2: Independent Branch Triggering with Error Isolation

**Current Behavior**: If `main` trigger fails, `dev` trigger never runs

**Proposed Behavior**: Each branch trigger is independent; failures are logged but don't block other branches

**Implementation**:
- Use `continue-on-error: true` for each trigger step
- Collect results from both triggers
- Report success/failure for each branch separately
- Final step status reflects overall success (at least one branch succeeded)

---

### Improvement 3: Retry Logic with Exponential Backoff

**Problem**: Transient API failures cause permanent backup failure

**Solution**: Retry failed API calls with exponential backoff

**Implementation**:
- Retry up to 3 times
- Initial delay: 5 seconds
- Exponential backoff: 5s, 10s, 20s
- Only retry on retryable errors (rate limits, network errors)

---

### Improvement 4: Backup Workflow Verification

**Problem**: No confirmation that backup workflow actually started

**Solution**: Verify backup workflow was triggered successfully

**Implementation**:
- After triggering, wait briefly (10-15 seconds)
- Query GitHub API to verify workflow run exists
- Check that workflow run status is `queued` or `in_progress`
- Log verification result

---

### Improvement 5: Timeout Configuration

**Problem**: No timeout for backup operations

**Solution**: Add configurable timeouts

**Implementation**:
- Set timeout for entire backup workflow (e.g., 30 minutes)
- Set timeout for individual backup steps
- Fail gracefully if timeout exceeded
- Log timeout events clearly

---

### Improvement 6: Token Validation

**Problem**: Invalid token causes silent failure

**Solution**: Validate token before use

**Implementation**:
- Test token by making a simple API call (e.g., get repository info)
- Fail fast with clear error message if token invalid
- Provide troubleshooting guidance in error message

---

### Improvement 7: Enhanced Concurrency Control

**Problem**: Scheduled backups might conflict with other triggers

**Solution**: Ensure concurrency control works for all trigger types

**Current**: Concurrency control exists but verify it works for `workflow_dispatch` triggers

**Implementation**:
- Verify concurrency group works for scheduled backups
- Test concurrent scheduled + manual + push triggers
- Ensure proper queuing behavior

---

### Improvement 8: Comprehensive Error Reporting

**Problem**: Errors not easily visible or actionable

**Solution**: Enhanced error reporting and monitoring

**Implementation**:
- Summary step at end of trigger workflow
- Clear success/failure indicators
- Detailed error messages with troubleshooting steps
- Optional: GitHub status checks or notifications

---

## 📐 Detailed Implementation Plan

### Phase 1: Critical Fixes (Immediate)

#### 1.1 Update Production Schedule
- Change cron from `"35 8 * * *"` to `"16 8 * * *"`
- Update comments to reflect production schedule
- Document schedule in README

#### 1.2 Error Isolation for Branch Triggers
- Make each branch trigger independent
- Use `continue-on-error: true`
- Add summary step to report results

#### 1.3 Add Retry Logic
- Implement retry wrapper for API calls
- Add exponential backoff
- Handle retryable vs non-retryable errors

**Estimated Time**: 1-2 hours

---

### Phase 2: Reliability Enhancements (Short-term)

#### 2.1 Token Validation
- Add token validation step
- Clear error messages for invalid tokens
- Troubleshooting guidance

#### 2.2 Backup Verification
- Verify backup workflow was triggered
- Check workflow run status
- Log verification results

#### 2.3 Timeout Configuration
- Add timeout to backup workflow
- Configure per-step timeouts
- Handle timeout errors gracefully

**Estimated Time**: 2-3 hours

---

### Phase 3: Monitoring & Reporting (Medium-term)

#### 3.1 Enhanced Error Reporting
- Summary step with clear status
- Detailed error messages
- Success/failure indicators

#### 3.2 Monitoring Integration
- Optional: GitHub status checks
- Optional: Notifications (email, Slack, etc.)
- Logging improvements

#### 3.3 Documentation Updates
- Update README with troubleshooting
- Document error scenarios
- Add monitoring guide

**Estimated Time**: 2-3 hours

---

## 🔧 Technical Implementation Details

### Error Isolation Pattern

```yaml
- name: Trigger backup on main branch
  id: trigger-main
  continue-on-error: true
  uses: actions/github-script@v7
  with:
    script: |
      # ... trigger logic with retry
      
- name: Trigger backup on dev branch
  id: trigger-dev
  continue-on-error: true
  uses: actions/github-script@v7
  with:
    script: |
      # ... trigger logic with retry

- name: Summary
  run: |
    MAIN_STATUS="${{ steps.trigger-main.outcome }}"
    DEV_STATUS="${{ steps.trigger-dev.outcome }}"
    # Report results
    # Exit with error only if both failed
```

### Retry Logic Pattern

```javascript
async function triggerWithRetry(workflowId, ref, maxRetries = 3) {
  let lastError;
  for (let attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      await github.rest.actions.createWorkflowDispatch({
        owner: context.repo.owner,
        repo: context.repo.repo,
        workflow_id: workflowId,
        ref: ref
      });
      return { success: true, attempt };
    } catch (error) {
      lastError = error;
      if (isRetryableError(error) && attempt < maxRetries) {
        const delay = Math.pow(2, attempt) * 1000; // Exponential backoff
        await new Promise(resolve => setTimeout(resolve, delay));
        continue;
      }
      throw error;
    }
  }
  throw lastError;
}
```

### Verification Pattern

```javascript
async function verifyWorkflowTriggered(workflowId, ref) {
  // Wait for workflow to appear
  await new Promise(resolve => setTimeout(resolve, 15000));
  
  // Query for recent workflow runs
  const runs = await github.rest.actions.listWorkflowRuns({
    owner: context.repo.owner,
    repo: context.repo.repo,
    workflow_id: workflowId,
    branch: ref,
    per_page: 1
  });
  
  const latestRun = runs.data.workflow_runs[0];
  if (latestRun && latestRun.status !== 'completed') {
    return { verified: true, runId: latestRun.id };
  }
  return { verified: false };
}
```

## 📊 Success Criteria

### Reliability Metrics
- ✅ Scheduled backups run at correct time (within 5 minutes of scheduled time)
- ✅ Success rate > 99% (accounting for transient failures)
- ✅ Both branches backed up successfully
- ✅ Recovery from transient failures within retry attempts

### Error Handling
- ✅ Transient API failures retried automatically
- ✅ One branch failure doesn't block the other
- ✅ Clear error messages for troubleshooting
- ✅ Invalid tokens detected and reported immediately

### Monitoring
- ✅ Clear success/failure indicators
- ✅ Detailed logs for debugging
- ✅ Summary of backup status for both branches

## ⚠️ Considerations

### GitHub Actions Limitations
- **Scheduled workflows**: Can be delayed by up to 15 minutes
- **API rate limits**: 1000 requests/hour per repository
- **Workflow run limits**: Varies by plan

### Mitigation Strategies
- Accept that scheduled backups may be slightly delayed
- Implement retry logic to handle rate limits
- Monitor API usage and adjust if needed

### Cost Considerations
- Each scheduled backup = 2 workflow runs (main + dev)
- Retry logic may increase API calls
- Monitor GitHub Actions minutes usage

## 🔄 Testing Strategy

### Unit Testing
- Test retry logic with various error scenarios
- Test error isolation between branches
- Test token validation

### Integration Testing
- Test full scheduled backup flow
- Test concurrent scheduled + manual triggers
- Test failure scenarios and recovery

### Production Testing
- Monitor first few scheduled backups
- Verify timing accuracy
- Check error handling in real scenarios

## 📚 Documentation Updates

### README Updates
- Document scheduled backup timing
- Add troubleshooting section
- Explain error handling and retry logic

### Workflow Comments
- Update comments to reflect production schedule
- Document retry behavior
- Explain error isolation

## ✅ Implementation Checklist

### Critical (Phase 1)
- [ ] Update cron schedule to production time
- [ ] Implement error isolation for branch triggers
- [ ] Add retry logic with exponential backoff
- [ ] Test error scenarios

### Important (Phase 2)
- [ ] Add token validation
- [ ] Implement backup verification
- [ ] Add timeout configuration
- [ ] Test timeout scenarios

### Enhancement (Phase 3)
- [ ] Enhanced error reporting
- [ ] Monitoring integration (optional)
- [ ] Documentation updates
- [ ] Production monitoring

## 🔗 Related Documents

- [System Plan](./system-plan.md) - Overall system architecture
- [Full Database Dump Plan](./full-database-dump-plan.md) - Backup implementation
- [Development Plan](./development-plan.md) - Implementation phases

## 📝 Notes

- Focus on reliability and error handling
- Prioritize critical fixes first
- Test thoroughly before production deployment
- Monitor first few scheduled backups closely
- Be prepared to adjust based on real-world behavior
