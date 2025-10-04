# 🌾 Smart Farming App

A comprehensive mobile and web application for farmers to access real-time mandi prices, fertilizer guidance, and agricultural assistance.

## 📱 Features

- **Real-time Mandi Prices**: Get live commodity prices from government APIs
- **Fertilizer Guide**: Detailed crop-specific fertilizer recommendations
- **Price Trends**: Visual charts showing price trends over time
- **AI Chatbot**: Interactive assistant for agricultural queries
- **Cross-platform**: Works on Android, iOS, and Web

## 🏗️ Architecture

- **Frontend**: Flutter (Mobile & Web)
- **Backend**: Node.js + Express
- **Database**: MongoDB
- **APIs**: Data.gov.in for real-time prices

## 📁 Project Structure

```
CSP Final APP/
├── backend/                 # Node.js backend
│   ├── models/             # MongoDB models
│   ├── routes/             # API routes
│   ├── server.js           # Main server file
│   └── package.json        # Backend dependencies
├── frontend1/              # Flutter mobile app
│   ├── lib/                # Dart source code
│   │   ├── config/         # Environment configuration
│   │   ├── models/         # Data models
│   │   ├── providers/      # State management
│   │   ├── screens/        # UI screens
│   │   └── services/       # API services
│   ├── android/            # Android platform files
│   ├── ios/                # iOS platform files
│   └── pubspec.yaml        # Flutter dependencies
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites

- Node.js (v14 or higher)
- Flutter SDK (v3.0 or higher)
- MongoDB Atlas account
- Data.gov API key

### Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create `.env` file:
   ```env
   MONGO_URI=your_mongodb_connection_string
   DATA_GOV_API_KEY=your_data_gov_api_key
   PORT=5000
   ```

4. Start the server:
   ```bash
   npm start
   ```

### Frontend Setup

1. Navigate to frontend directory:
   ```bash
   cd frontend1
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 🌐 Environment Configuration

The app automatically switches between development and production environments.

### Development Mode
- Backend: `http://192.168.29.152:5000`
- For local network testing

### Production Mode
- Backend: `https://your-app.onrender.com`
- For deployed applications

To switch environments, edit `frontend1/lib/config/api_config.dart`:
```dart
static const bool isDev = true;  // false for production
```

## 📱 Mobile App Features

### Mandi Prices
- Real-time commodity prices
- Location-based filtering (State, District, Market)
- Price history and trends

### Fertilizer Guide
- Crop-specific recommendations
- Basal dose calculations
- Top dressing schedules

### Price Trends
- Interactive charts
- Historical data analysis
- Export capabilities

### AI Assistant
- Natural language queries
- Crop-specific advice
- Fertilizer recommendations

## 🔧 API Endpoints

- `GET /api/prices` - Fetch prices from database
- `GET /api/prices/fetch` - Fetch and save prices from external API

## 🚀 Deployment

### Backend (Render)
1. Connect GitHub repository to Render
2. Set environment variables
3. Deploy automatically

### Frontend (Mobile)
1. Build APK: `flutter build apk --release`
2. Install on Android devices
3. Configure for production environment

## 📊 Data Sources

- **Mandi Prices**: Data.gov.in API
- **Fertilizer Data**: Agricultural research data
- **Location Data**: Government district/market data

## 🛠️ Development

### Adding New Features
1. Update backend API routes
2. Add corresponding Flutter screens
3. Update state management
4. Test on multiple devices

### Environment Variables
- `MONGO_URI`: MongoDB connection string
- `DATA_GOV_API_KEY`: Government API key
- `NODE_ENV`: Environment (development/production)

## 📄 License

This project is for educational purposes as part of CSP Final Project.

## 👥 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📞 Support

For issues and questions, please create an issue in the GitHub repository.

---

**Built with ❤️ for farmers and agriculture**
