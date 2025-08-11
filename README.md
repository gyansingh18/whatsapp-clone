# 💬 WhatsApp Clone

A full-featured, real-time chat application built with Ruby on Rails that mimics WhatsApp's core functionality and design.

![WhatsApp Clone](https://img.shields.io/badge/WhatsApp-Clone-25D366?style=for-the-badge&logo=whatsapp)
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-7.1-CC0000?style=for-the-badge&logo=ruby-on-rails)
![WebSocket](https://img.shields.io/badge/WebSocket-Real--time-blue?style=for-the-badge)

## ✨ Features

### 🔐 **Authentication & User Management**
- User registration and secure login
- Password encryption with bcrypt
- Session management
- Online/offline status tracking
- User profiles with avatars

### 💬 **Real-time Messaging**
- **Direct Messages**: One-on-one private conversations
- **Group Chats**: Multi-user group conversations
- **Real-time updates** with Action Cable WebSockets
- Message history and persistence
- Message timestamps
- Auto-scrolling chat interface

### 🎨 **WhatsApp-like UI/UX**
- Authentic WhatsApp green color scheme (#128c7e, #25d366)
- Responsive design for desktop and mobile
- Chat sidebar with conversation list
- Online users section with live status
- Message bubbles with sent/received styling
- Smooth animations and transitions
- Modern, clean interface

### 🚀 **Advanced Functionality**
- Create new direct chats by clicking online users
- Create and manage group chats
- Real-time message broadcasting
- Enter to send, Shift+Enter for new line
- Auto-resizing message input
- Flash notifications
- Persistent chat history

## 🛠️ **Tech Stack**

- **Backend**: Ruby on Rails 7.1
- **Database**: SQLite with proper associations and constraints
- **Real-time**: Action Cable WebSockets
- **Frontend**: Modern CSS3 with responsive design
- **Authentication**: Rails sessions with secure cookies
- **Styling**: Custom CSS with WhatsApp-inspired design

## 📱 **Screenshots**

### Login/Signup Pages
Beautiful authentication pages with WhatsApp branding and responsive design.

### Chat Interface
- Clean sidebar with chat list and online users
- Real-time messaging with proper message bubbles
- Group chat support with member indicators
- Mobile-responsive layout

## 🚀 **Getting Started**

### Prerequisites
- Ruby 3.3.5 or higher
- Rails 7.1 or higher
- SQLite3

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/chat-personal.git
   cd chat-personal
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   Open your browser and go to `http://localhost:3000`

### 🧪 **Test Accounts**

The seed data creates sample users for testing:
- **alice@example.com** / password123
- **bob@example.com** / password123
- **charlie@example.com** / password123
- **diana@example.com** / password123

## 🎯 **Usage**

1. **Sign up** for a new account or **log in** with test credentials
2. **Browse existing chats** in the sidebar (sample conversations included)
3. **Start new direct chats** by clicking on online users
4. **Create group chats** using the + button in the sidebar
5. **Send real-time messages** with instant delivery
6. **Test multi-user functionality** by opening multiple browser tabs

## 🏗️ **Project Structure**

```
app/
├── controllers/
│   ├── application_controller.rb    # Base controller with auth helpers
│   ├── chats_controller.rb         # Chat management
│   ├── messages_controller.rb      # Message handling
│   ├── sessions_controller.rb      # Login/logout
│   └── users_controller.rb         # User registration
├── models/
│   ├── user.rb                     # User model with authentication
│   ├── chat.rb                     # Chat model (direct/group)
│   ├── message.rb                  # Message model with broadcasting
│   └── chat_user.rb                # Join table for chat members
├── views/
│   ├── layouts/application.html.erb # Main layout with navbar
│   ├── chats/                      # Chat interface views
│   ├── sessions/                   # Login/logout views
│   └── users/                      # Registration and profile views
├── channels/
│   └── chat_channel.rb             # WebSocket channel for real-time messaging
└── assets/stylesheets/
    └── application.css             # WhatsApp-inspired styling
```

## 🔧 **Key Features Implementation**

### Real-time Messaging
- Uses Action Cable for WebSocket connections
- Messages broadcast instantly to all chat participants
- Optimistic UI updates for smooth user experience

### Database Design
- Proper associations between Users, Chats, and Messages
- ChatUser join table for many-to-many relationships
- Efficient queries with includes and joins

### Security
- CSRF protection
- SQL injection prevention with Arel.sql
- Secure password hashing
- Session-based authentication

## 🤝 **Contributing**

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 **Future Enhancements**

- [ ] File and image sharing
- [ ] Voice message support
- [ ] Video calling integration
- [ ] Message reactions and replies
- [ ] Message search functionality
- [ ] Push notifications
- [ ] Dark mode theme
- [ ] Message encryption
- [ ] User blocking and reporting
- [ ] Chat backup and export

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 **Acknowledgments**

- Inspired by WhatsApp's design and functionality
- Built with Ruby on Rails and Action Cable
- Uses modern web technologies for real-time communication

## 📞 **Contact**

Your Name - [your-email@example.com](mailto:your-email@example.com)

Project Link: [https://github.com/yourusername/chat-personal](https://github.com/yourusername/chat-personal)

---

⭐ **Star this repository if you found it helpful!**

<!-- Update 5: Mon Aug 11 10:16:58 IST 2025 -->

<!-- Update 10: Mon Aug 11 10:16:59 IST 2025 -->

<!-- Update 15: Mon Aug 11 10:16:59 IST 2025 -->

<!-- Update 20: Mon Aug 11 10:17:00 IST 2025 -->

<!-- Update 25: Mon Aug 11 10:17:01 IST 2025 -->

<!-- Update 30: Mon Aug 11 10:17:02 IST 2025 -->

<!-- Update 35: Mon Aug 11 10:17:02 IST 2025 -->

<!-- Update 40: Mon Aug 11 10:17:03 IST 2025 -->

<!-- Update 45: Mon Aug 11 10:17:04 IST 2025 -->
