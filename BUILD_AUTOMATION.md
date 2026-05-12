# Build Automation Guide

This repository has **complete automated build pipelines** for both Android and Windows apps.

## 🚀 Automated Builds (GitHub Actions)

### What Happens Automatically:

#### 1. **Android APK Build** (`.github/workflows/android-build.yml`)
- Triggers on every `git push` to `main` or `develop`
- Builds both Debug and Release APKs
- Artifacts stored for 30 days
- Auto-attached to releases when you create a Git tag

#### 2. **Windows EXE Build** (`.github/workflows/windows-build.yml`)
- Triggers on every `git push` to `main` or `develop`
- Builds Windows EXE using PyInstaller
- Artifacts stored for 30 days
- Auto-attached to releases when you create a Git tag

#### 3. **Full Build** (`.github/workflows/full-build.yml`)
- Builds both Android + Windows simultaneously
- Runs weekly (Sunday at midnight UTC)
- Creates releases with all artifacts combined

---

## 📦 How to Use

### For Automated Builds:

**1. Just push your code:**
```bash
git push origin main
```
→ Builds start automatically in GitHub Actions

**2. Check build status:**
- Go to your repo → **Actions** tab
- Watch builds in real-time
- Download artifacts when complete

**3. Create a Release with Built Apps:**
```bash
git tag v1.0.0
git push origin v1.0.0
```
→ Both APK + EXE automatically attached to GitHub Release

---

### For Local Builds:

#### **Build Android APK:**

**On macOS/Linux:**
```bash
chmod +x build.sh
./build.sh
```

**On Windows (Command Prompt):**
```cmd
build.bat
```

Output: `app/build/outputs/apk/debug/` and `app/build/outputs/apk/release/`

---

#### **Build Windows EXE:**

**On macOS/Linux:**
```bash
chmod +x build-windows.sh
./build-windows.sh
```

**On Windows (Command Prompt):**
```cmd
build-windows.bat
```

Output: `dist/PhoneProxyManager.exe`

---

## 🔍 View Build Results

1. Go to: **https://github.com/moreadderallplz/hotspot-bypass-build/actions**
2. Click on any workflow run
3. Scroll to **Artifacts** section
4. Download APK or EXE directly

---

## 📝 Build Artifacts Retention

- **Default retention**: 30 days (full-build: 90 days)
- Artifacts auto-deleted after retention period
- Releases keep artifacts indefinitely

---

## 🎯 Workflow Files

| File | Purpose |
|------|---------|
| `.github/workflows/android-build.yml` | Android APK auto-build |
| `.github/workflows/windows-build.yml` | Windows EXE auto-build |
| `.github/workflows/full-build.yml` | Combined build + releases |
| `build.sh` | Local Android build (macOS/Linux) |
| `build.bat` | Local Android build (Windows) |
| `build-windows.sh` | Local Windows build (macOS/Linux) |
| `build-windows.bat` | Local Windows build (Windows) |

---

## ⚙️ Customization

### Change Build Schedule:
Edit `.github/workflows/full-build.yml`:
```yaml
schedule:
  - cron: '0 0 * * 0'  # Change this cron expression
```

### Change Artifact Retention:
Edit workflow files:
```yaml
retention-days: 30  # Change to desired days
```

### Add Signing (APK Release):
Add your keystore to repository secrets, then update `android-build.yml` with signing task.

---

## 🐛 Troubleshooting

**Build fails on GitHub Actions?**
- Check the Actions tab for error logs
- Ensure `build.gradle.kts` dependencies are correct
- For Python issues, verify `PhoneProxyManager.py` has all required imports

**Local build fails?**
- Android: Ensure JDK 11+ is installed
- Windows: Ensure Python 3.8+ is installed
- Run: `./gradlew clean` (Android) before retrying

---

## ✅ Summary

**You now have:**
- ✅ Automated Android APK builds
- ✅ Automated Windows EXE builds  
- ✅ Automatic release creation with both apps
- ✅ Weekly automated builds
- ✅ Local build scripts as backup

**Just push code. Everything else is automatic!** 🎉
