# The Magnificent Three - Brain Tumor Classification System

A powerful and user-friendly application that combines Flutter for the frontend and machine learning for brain tumor classification and streamlit. This project provides a seamless interface for medical professionals and researchers to classify brain tumor images using various machine learning models.

## 🚀 Features

- **Multiple ML Models**: Support for various classification algorithms:
  - Decision Tree
  - Naive Bayes
  - Logistic Regression
  - Random Forest
  - Support Vector Classification (SVC)
  - K-Nearest Neighbors (KNN)
- **Real-time Classification**: Instant tumor classification results
- **Cross-platform Support**: Works on Windows, macOS, Linux, iOS, and Android
- **User-friendly Interface**: Modern and intuitive UI built with Flutter
- **Confidence Scores**: Provides probability scores for predictions
- **Multiple Tumor Types**: Classifies between:
  - Meningioma
  - Glioma
  - Pituitary Tumor

## 🏗️ Project Structure

```
the-magnificent-three/
├── flutter_ml/           # Flutter frontend application
│   ├── lib/             # Dart source code
│   ├── images/          # Application assets
│   └── pubspec.yaml     # Flutter dependencies
├── ML_Model/            # Backend ML server
│   ├── FlaskForClassification.py  # Classification API
│   ├── FlaskForRegression.py      # Regression API
│   ├── app.py                     # stramlit
│   ├── Brain_tumor.ipynb          # code for it to models
│   └── Models/          # Trained ML models a 
└── images for test/     # Test images
```

## 🛠️ Prerequisites

- Python 3.x
- Flutter SDK
- Flask
- Required Python packages (install via pip):
  - flask
  - joblib
  - numpy
  - Pillow
- Required Flutter packages (automatically installed via pubspec.yaml)

## 🚀 Getting Started


1. **Setup the Flutter Frontend**
   ```bash
   cd flutter_ml
   flutter pub get
   flutter run
   ```

2. **Run the Application**
   - For Windows users, you can use the provided `run it first.bat` script and this location of app.exe "the-magnificent-three\flutter_ml\build\windows\x64\runner\Debug\flutter_ml.exe"
   - Or run the Flutter app directly using `flutter run`

## 💻 Usage

1. Launch the application
2. Select or drag-and-drop a brain MRI image
3. Choose your preferred ML model
4. Click "Classify" to get the results
5. View the classification results and confidence scores
## 💻 Screenshots

<img src="https://github.com/user-attachments/assets/62f6417c-4105-49c8-a238-44e8d09df4f6" width="400"/>

<img src="https://github.com/user-attachments/assets/fb3f2568-bdf3-4e6f-946a-9437f8a6d04b" width="400"/>
<img src="https://github.com/user-attachments/assets/617dbec3-4fcf-4e8c-8f39-ae086093c090" width="400"/>

<img src="https://github.com/user-attachments/assets/6c2ea437-639f-404a-b184-dbc5bff3bd82" width="400"/>


## ⚠️ Disclaimer

This application is intended for research and educational purposes only. It should not be used as a substitute for professional medical advice, diagnosis, or treatment.

## 📧 Contact

For any questions or suggestions, please open an issue in the GitHub repository.

## 👥 Collaboration

This project is the result of collaborative work between three talented developers:

### Team Members and Contributions

1. **[@ZeyadElshenawy](https://github.com/ZeyadElshenawy)**
   - Developed and implemented the machine learning models
   - Created and trained classification algorithms (Decision Tree, Naive Bayes, Logistic Regression, Random Forest, SVC, KNN)
   - Optimized model performance for brain tumor classification

2. **[@AbdullahAhmedff](https://github.com/AbdullahAhmedff)**
   - Built the Streamlit web interface
   - Implemented the interactive dashboard for model visualization
   - Created user-friendly data visualization components


3. **[@mohaaHeiba](https://github.com/mohaaHeiba)**
   - Developed the Flutter desktop application
   - Created the Flask backend server
   - Integrated ML models with the frontend
   - Implemented the API endpoints for model inference
   - Connected all components into a cohesive system


### Project Integration
The team worked together to create a seamless integration between:
- Machine Learning Models
- Streamlit Dashboard
- Flutter desktop App
- Flask Backend Server

This collaborative effort resulted in a comprehensive brain tumor classification system that combines the strengths of each technology stack.
