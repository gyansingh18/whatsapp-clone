# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample users
users = [
  { username: 'alice', email: 'alice@example.com', password: 'password123' },
  { username: 'bob', email: 'bob@example.com', password: 'password123' },
  { username: 'charlie', email: 'charlie@example.com', password: 'password123' },
  { username: 'diana', email: 'diana@example.com', password: 'password123' }
]

created_users = []
users.each do |user_attrs|
  user = User.find_or_create_by(email: user_attrs[:email]) do |u|
    u.username = user_attrs[:username]
    u.password = user_attrs[:password]
    u.online = [true, false].sample # Random online status
  end
  created_users << user
  puts "Created user: #{user.username} (#{user.email})"
end

# Create some sample chats and messages
if created_users.length >= 2
  # Create a direct chat between Alice and Bob
  alice = created_users.find { |u| u.username == 'alice' }
  bob = created_users.find { |u| u.username == 'bob' }

  if alice && bob
    direct_chat = Chat.find_or_create_direct_chat(alice, bob)

    # Add some sample messages
    sample_messages = [
      { user: alice, content: "Hey Bob! How are you doing?" },
      { user: bob, content: "Hi Alice! I'm doing great, thanks for asking. How about you?" },
      { user: alice, content: "I'm doing well too! Just working on some projects." },
      { user: bob, content: "That sounds awesome! What kind of projects?" },
      { user: alice, content: "Mostly web development stuff. Building some cool chat applications!" }
    ]

    sample_messages.each do |msg_attrs|
      unless direct_chat.messages.exists?(content: msg_attrs[:content])
        direct_chat.messages.create!(
          user: msg_attrs[:user],
          content: msg_attrs[:content],
          created_at: rand(1.hour.ago..Time.current)
        )
      end
    end

    puts "Created direct chat between #{alice.username} and #{bob.username} with sample messages"
  end

  # Create a group chat
  if created_users.length >= 3
    group_chat = Chat.find_or_create_by(name: "Development Team", chat_type: 'group')

    # Add users to group chat
    created_users.take(3).each do |user|
      unless group_chat.chat_users.exists?(user: user)
        role = user == created_users.first ? 'admin' : 'member'
        group_chat.chat_users.create!(user: user, role: role)
      end
    end

    # Add some group messages
    group_messages = [
      { user: created_users[0], content: "Welcome to the development team chat!" },
      { user: created_users[1], content: "Thanks! Excited to be here." },
      { user: created_users[2], content: "Great to have everyone on board!" },
      { user: created_users[0], content: "Let's build something amazing together! 🚀" }
    ]

    group_messages.each do |msg_attrs|
      unless group_chat.messages.exists?(content: msg_attrs[:content])
        group_chat.messages.create!(
          user: msg_attrs[:user],
          content: msg_attrs[:content],
          created_at: rand(1.hour.ago..Time.current)
        )
      end
    end

    puts "Created group chat 'Development Team' with sample messages"
  end
end

puts "Seed data creation completed!"
puts "You can log in with any of these accounts:"
users.each do |user|
  puts "  #{user[:email]} / #{user[:password]}"
end
