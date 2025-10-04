# 🚀 Smart Farming App - Deployment Guide

## Part A: Flutter Frontend - Environment Switching ✅

The Flutter app now automatically switches between development and production environments.

### Configuration File: `lib/config/api_config.dart`

```dart
class ApiConfig {
  // Environment toggle - change this to switch between dev and production
  static const bool isDev = true; // set to false for production

  // Local development backend (for testing on same network)
  static const String localBaseUrl = "http://192.168.29.152:5000";
  
  // Production backend (will be updated after Render deployment)
  static const String prodBaseUrl = "https://myapp-backend.onrender.com";

  // Automatically returns the correct URL based on environment
  static String get baseUrl => isDev ? localBaseUrl : prodBaseUrl;
}
```

### How to Switch Environments:

1. **For Development (Current)**:
   ```dart
   static const bool isDev = true;
   ```

2. **For Production (After backend deployment)**:
   ```dart
   static const bool isDev = false;
   static const String prodBaseUrl = "https://YOUR-ACTUAL-RENDER-URL.onrender.com";
   ```

### What's Updated:
- ✅ All API calls now use `ApiConfig.baseUrl`
- ✅ Environment info displayed in app footer
- ✅ Clear comments for easy switching
- ✅ App compiles and runs without errors

---

## Part B: Backend Deployment to Render

### Step 1: Prepare Backend for Deployment

Since you already have your MongoDB configuration set up, you just need to:

1. **Ensure you have a `.env` file** in the backend folder with:
   ```env
   MONGO_URI=your_existing_mongodb_uri
   DATA_GOV_API_KEY=your_data_gov_api_key_here
   PORT=5000
   ```

2. **Your package.json is already configured correctly** with:
   ```json
   {
     "main": "server.js",
     "scripts": {
       "start": "node server.js"
     }
   }
   ```

### Step 2: Deploy to Render

1. **Go to [Render.com](https://render.com/)**
   - Sign up with GitHub account
   - Connect your repository

2. **Create New Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository containing your backend

3. **Configure Service**:
   ```
   Name: smart-farming-backend
   Environment: Node
   Region: Choose closest to your users
   Branch: main (or your main branch)
   Root Directory: backend (if backend is in a subfolder)
   Build Command: npm install
   Start Command: npm start
   ```

4. **Environment Variables**:
   Add these in Render dashboard (use your existing values):
   ```
   MONGO_URI=your_existing_mongodb_uri
   DATA_GOV_API_KEY=your_data_gov_api_key_here
   NODE_ENV=production
   ```

5. **Deploy**:
   - Click "Create Web Service"
   - Wait for deployment (5-10 minutes)
   - Note the URL: `https://smart-farming-backend.onrender.com`

### Step 3: Update Flutter App

1. **Update Production URL**:
   ```dart
   // In lib/config/api_config.dart
   static const String prodBaseUrl = "https://smart-farming-backend.onrender.com";
   ```

2. **Switch to Production**:
   ```dart
   static const bool isDev = false; // Change to false for production
   ```

3. **Build Production APK**:
   ```bash
   flutter build apk --release
   ```

### Step 4: Test Production Deployment

1. **Test Backend**:
   - Visit: `https://your-app.onrender.com/api/prices`
   - Should return JSON data or empty array

2. **Test Flutter App**:
   - Install APK on device
   - Check footer shows "Environment: Production"
   - Test API calls work

---

## 🎯 Quick Reference

### Development Mode:
- ✅ `isDev = true`
- ✅ Uses local network IP
- ✅ Shows "Environment: Development"

### Production Mode:
- ✅ `isDev = false`
- ✅ Uses Render URL
- ✅ Shows "Environment: Production"

### Backend URLs:
- **Development**: `http://192.168.29.152:5000`
- **Production**: `https://your-app.onrender.com`

---

## 🔧 Troubleshooting

### Common Issues:

1. **CORS Errors**:
   - Backend already has CORS enabled
   - Should work with any domain

2. **MongoDB Connection**:
   - Ensure MongoDB Atlas allows connections from anywhere (0.0.0.0/0)
   - Check connection string format

3. **API Key Issues**:
   - Verify DATA_GOV_API_KEY is set in Render environment variables
   - Check API key is valid and active

4. **Render Deployment Fails**:
   - Check build logs in Render dashboard
   - Ensure all dependencies are in package.json
   - Verify start command is correct

### Testing Commands:

```bash
# Test backend locally
curl http://localhost:5000/api/prices

# Test production backend
curl https://your-app.onrender.com/api/prices

# Build Flutter app
flutter build apk --release
```

---

## 📱 Final Result

After deployment:
- ✅ Backend running on Render (publicly accessible)
- ✅ Flutter app switches environments automatically
- ✅ Production APK ready for distribution
- ✅ All API calls work in both dev and production
