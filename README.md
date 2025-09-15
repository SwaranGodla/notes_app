# 📝 Flutter Notes App

A beautiful and intuitive notes application built with Flutter that allows users to create, edit, and manage their personal notes with colorful themes and local database storage.

## ✨ Features

- **📱 Modern UI Design**: Dark theme with elegant blue-grey color scheme
- **🎨 Colorful Notes**: Choose from 20+ vibrant colors for your notes
- **📝 Rich Note Creation**: Add titles and detailed descriptions
- **✏️ Edit Notes**: Tap any note to edit its content
- **🗑️ Delete Notes**: Remove unwanted notes with a simple tap
- **📅 Date Tracking**: Automatic date stamping for each note
- **💾 Local Storage**: SQLite database for reliable data persistence
- **📱 Responsive Grid Layout**: Beautiful 2-column grid view for notes
- **🎯 Empty State**: Friendly empty state when no notes exist

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                 # App entry point and theme configuration
├── database/
│   └── notes_database.dart   # SQLite database operations
└── screens/
    ├── notes_screen.dart     # Main screen with notes grid
    ├── note_card.dart        # Individual note card widget
    └── note_dialog.dart      # Add/Edit note dialog
```

### Key Components

#### 🗄️ Database Layer (`notes_database.dart`)
- **Singleton Pattern**: Ensures single database instance
- **SQLite Integration**: Local database using `sqflite` package
- **CRUD Operations**: Create, Read, Update, Delete notes
- **Schema**: Notes table with id, title, description, date, and color fields

#### 🖥️ UI Components
- **NotesScreen**: Main screen with floating action button and notes grid
- **NoteCard**: Displays individual notes with color-coded backgrounds
- **NoteDialog**: Modal dialog for creating and editing notes

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flutter_application_notes
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

- **flutter**: Core Flutter framework
- **sqflite**: SQLite database for local storage
- **intl**: Internationalization and date formatting
- **path**: Path manipulation utilities
- **cupertino_icons**: iOS-style icons

## 🎨 Design Features

### Color Palette
The app uses a carefully selected color palette with 20+ vibrant colors:
- Red (`#F44336`)
- Green (`#8BC34A`)
- Blue (`#4FC3F7`)
- Yellow (`#FFC107`)
- Purple (`#9575CD`)
- And many more...

### Theme
- **Primary Color**: Blue Grey
- **Background**: Dark (`#1E1E1E`)
- **Text**: White and black variants
- **Cards**: Rounded corners (20px radius)

## 🔧 Technical Details

### Database Schema
```sql
CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    date TEXT NOT NULL,
    color INTEGER NOT NULL
);
```

### Key Features Implementation
- **State Management**: Uses `StatefulWidget` for local state
- **Async Operations**: Database operations are handled asynchronously
- **Error Handling**: Graceful error handling for database operations
- **Performance**: Efficient grid rendering with `GridView.builder`

## 📱 Screenshots

The app features:
- Clean dark interface with colorful note cards
- Intuitive floating action button for adding notes
- Beautiful grid layout for note organization
- Elegant dialog for note creation and editing
- Color picker for note customization

## 🛠️ Development

### Code Structure
- **Separation of Concerns**: Database, UI, and business logic are separated
- **Reusable Components**: Modular widget design
- **Clean Architecture**: Single responsibility principle followed
- **Type Safety**: Strong typing with Dart

### Future Enhancements
- Search functionality
- Note categories/tags
- Export notes
- Cloud synchronization
- Rich text formatting
- Image attachments

## 📄 License

This project is for educational purposes and personal use.

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements.

---

**Built with ❤️ using Flutter**
