# Angular Feedback App 🚀

![Angular](https://img.shields.io/badge/Angular-20.1-red?logo=angular)
![TypeScript](https://img.shields.io/badge/TypeScript-5.8-blue?logo=typescript)
![Node.js](https://img.shields.io/badge/Node.js-22.13-green?logo=node.js)

A modern Angular 18+ application showcasing client-side navigation, API integration, and reactive forms. Built with standalone components and the latest Angular features including Angular SSR and signals.

## 🌟 Features

### ✅ **Core Requirements Implemented**
- **🏠 Home Page**: Clean landing page with introductory content and feature showcase
- **📊 API Data Page**: Fetches and displays data from JSONPlaceholder API with loading states and error handling
- **📝 Feedback Form**: Reactive form with comprehensive validation and user feedback
- **🧭 Client-Side Navigation**: Angular Router implementation with active route highlighting
- **🔄 Angular Service**: Centralized API service using HttpClient
- **✅ Form Validation**: Real-time validation with custom error messages

### 🎨 **Additional Features**
- **📱 Responsive Design**: Mobile-first approach with CSS Grid and Flexbox
- **🎯 Modern UI/UX**: Clean, professional design with smooth animations
- **⚡ Performance**: Built with Angular 18 standalone components
- **🔄 Loading States**: Visual feedback for all async operations
- **🎛️ Interactive Elements**: Tab-based navigation, hover effects
- **📡 SSR Ready**: Server-Side Rendering capabilities

## 🛠️ Technology Stack

- **Frontend Framework**: Angular 20.1 (Latest)
- **Language**: TypeScript 5.8
- **Styling**: CSS3 with CSS Grid, Flexbox, and CSS Variables
- **HTTP Client**: Angular HttpClient with RxJS
- **Forms**: Angular Reactive Forms with Validators
- **Routing**: Angular Router with lazy loading
- **Build Tool**: Angular CLI with Vite
- **Package Manager**: NPM

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ (22.13+ recommended)
- npm 9+ or yarn
- Angular CLI 20+

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd angular-feedback-app

# Install dependencies
npm install

# Start development server
npm start
# or
ng serve
```

The application will be available at `http://localhost:4200`

## 📁 Project Structure

```
src/
├── app/
│   ├── api-data/          # API data display component
│   │   ├── api-data.ts    # Component logic with signals
│   │   ├── api-data.html  # Template with @if and @for
│   │   └── api-data.css   # Component styles
│   ├── form-page/         # Reactive form component
│   │   ├── form-page.ts   # Form logic with validation
│   │   ├── form-page.html # Form template
│   │   └── form-page.css  # Form styles
│   ├── home/              # Landing page component
│   │   ├── home.ts        # Home component
│   │   ├── home.html      # Hero section and features
│   │   └── home.css       # Home page styles
│   ├── navigation/        # Navigation bar component
│   │   ├── navigation.ts  # Navigation logic
│   │   ├── navigation.html# Nav template with routerLink
│   │   └── navigation.css # Navigation styles
│   ├── services/          # Application services
│   │   └── api.ts         # API service with HttpClient
│   ├── app.ts             # Root component
│   ├── app.html           # App template
│   ├── app.css            # Global app styles
│   ├── app.config.ts      # App configuration
│   └── app.routes.ts      # Route definitions
├── styles.css             # Global styles
└── main.ts                # Application bootstrap
```

## 🎯 Component Overview

### 🏠 Home Component
- Hero section with application introduction
- Feature showcase with animated cards
- Call-to-action buttons with routing
- Responsive grid layout

### 📊 API Data Component
- Tab-based interface (Posts/Users)
- Data fetching from JSONPlaceholder API
- Loading spinners and error handling
- Responsive card layout
- Modern Angular signals for state management

### 📝 Form Page Component
- Reactive form with 5 validated fields:
  - Full Name (required, min 2 chars)
  - Email (required, valid email format)
  - Subject (required, min 5 chars)
  - Rating (1-5 scale)
  - Message (required, min 10 chars)
- Real-time validation with custom error messages
- Loading state during form submission
- Success feedback with auto-reset

### 🧭 Navigation Component
- Responsive navigation bar
- Active route highlighting
- Mobile-friendly design
- Smooth transitions

### 🔧 API Service
- Centralized HTTP client service
- TypeScript interfaces for type safety
- Error handling with RxJS
- RESTful API integration

## 🎨 Design System

### Color Palette
- **Primary**: #3498db (Blue)
- **Secondary**: #2c3e50 (Dark Blue-Gray)
- **Success**: #27ae60 (Green)
- **Warning**: #f39c12 (Orange)
- **Danger**: #e74c3c (Red)
- **Light**: #ecf0f1 (Light Gray)
- **Dark**: #2c3e50 (Dark Gray)

### Typography
- **Font Family**: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif
- **Responsive scaling**: rem units with mobile-first approach

## 📱 Responsive Design

- **Mobile First**: Optimized for mobile devices
- **Breakpoints**:
  - Mobile: < 768px
  - Tablet: 768px - 1024px
  - Desktop: > 1024px
- **Flexible Layouts**: CSS Grid and Flexbox
- **Touch-Friendly**: Adequate touch targets and spacing

## 🔧 Development

### Available Scripts

```bash
# Development server
npm start              # Start dev server on port 4200
ng serve              # Alternative command

# Building
npm run build         # Production build
ng build              # Alternative command

# Testing
npm test              # Run unit tests
npm run test:watch    # Run tests in watch mode

# Linting
npm run lint          # Run ESLint

# Code Generation
ng generate component <name>  # Generate new component
ng generate service <name>     # Generate new service
```

### Code Quality
- TypeScript strict mode enabled
- ESLint configuration for Angular
- Prettier for code formatting
- Angular style guide compliance

## 🚀 Deployment

The application is ready for deployment to various platforms:

### Netlify Deployment
1. Build the application: `ng build`
2. Deploy the `dist/angular-feedback-app/browser` folder
3. Configure redirects for SPA routing

### Vercel Deployment
1. Connect your GitHub repository
2. Vercel will automatically detect Angular
3. Build command: `ng build`
4. Output directory: `dist/angular-feedback-app/browser`

### GitHub Pages
1. Install Angular CLI GitHub Pages: `npm install -g angular-cli-ghpages`
2. Build and deploy: `ng deploy --base-href=https://yourusername.github.io/repository/`

## 🌐 API Integration

The application uses the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API:
- **Posts Endpoint**: `/posts` - Fetches sample blog posts
- **Users Endpoint**: `/users` - Fetches user information
- **HTTP Methods**: GET requests with proper error handling
- **Response Caching**: Browser caching enabled

## 📋 Form Features

### Validation Rules
- **Real-time validation**: Validates on input change
- **Custom error messages**: User-friendly error descriptions
- **Field highlighting**: Visual indication of invalid fields
- **Submit protection**: Prevents submission of invalid forms

### Form Fields
1. **Name**: Text input with minimum length validation
2. **Email**: Email validation with regex pattern
3. **Subject**: Text input with character requirements
4. **Rating**: Dropdown selection (1-5 scale)
5. **Message**: Textarea with minimum character count

## 🎯 Performance Optimizations

- **Standalone Components**: Reduced bundle size
- **Lazy Loading**: Route-based code splitting
- **OnPush Change Detection**: Optimized rendering
- **RxJS Best Practices**: Proper subscription management
- **Modern Angular Features**: Signals for reactive state management

## 🔄 State Management

- **Angular Signals**: Modern reactive state management
- **RxJS**: For async operations and API calls
- **Local Component State**: For form and UI state
- **Service State**: Centralized data management

## 🧪 Testing

The project includes comprehensive testing setup:
- **Unit Tests**: Jasmine and Karma configuration
- **Component Testing**: Isolated component testing
- **Service Testing**: HTTP client mocking
- **E2E Ready**: Prepared for end-to-end testing

## 📈 Browser Support

- **Modern Browsers**: Chrome, Firefox, Safari, Edge (latest versions)
- **Mobile Browsers**: iOS Safari, Chrome Mobile
- **Progressive Enhancement**: Graceful degradation for older browsers

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Run tests: `npm test`
5. Commit changes: `git commit -m 'Add feature'`
6. Push to branch: `git push origin feature-name`
7. Submit a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🎉 Acknowledgments

- **Angular Team**: For the amazing framework and tools
- **JSONPlaceholder**: For the free API service
- **Community**: For the inspiration and best practices

---

**Built with ❤️ using Angular 20.1 and modern web technologies**

*For questions or support, please open an issue in the repository.*
