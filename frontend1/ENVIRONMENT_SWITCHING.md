# 🔄 Environment Switching Quick Reference

## Current Configuration

The app is currently set to **DEVELOPMENT** mode:
- Backend: `http://192.168.29.152:5000`
- Environment: Development

## Quick Switch Commands

### Switch to Development:
```bash
# Method 1: Edit file directly
# Change in lib/config/api_config.dart:
static const bool isDev = true;

# Method 2: Use script (if available)
dart scripts/switch_env.dart dev
```

### Switch to Production:
```bash
# Method 1: Edit file directly
# Change in lib/config/api_config.dart:
static const bool isDev = false;

# Method 2: Use script (if available)
dart scripts/switch_env.dart prod
```

## What Changes When You Switch:

| Setting | Development | Production |
|---------|-------------|------------|
| `isDev` | `true` | `false` |
| Backend URL | `http://192.168.29.152:5000` | `https://myapp-backend.onrender.com` |
| App Footer | "Environment: Development" | "Environment: Production" |
| API Calls | Local network | Cloud server |

## After Switching:

1. **Clean and rebuild**:
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --debug
   ```

2. **Test the app**:
   - Check footer shows correct environment
   - Test API calls work
   - Verify data loads correctly

## Troubleshooting:

- **App shows old environment**: Run `flutter clean` and rebuild
- **API calls fail**: Check if backend is running and accessible
- **Wrong URL**: Verify `prodBaseUrl` in `api_config.dart` is correct

## Files to Check:

- `lib/config/api_config.dart` - Main configuration
- `lib/services/api_service.dart` - API calls
- `lib/screens/home_screen.dart` - Environment display
