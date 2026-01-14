CREATE DATABASE IF NOT EXISTS unisole_uphy;
USE unisole_uphy;

-- Store your 147 simulations here for fast SQL querying
CREATE TABLE simulations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    url TEXT NOT NULL,
    description TEXT
);

-- Store chat history so U-PHY remembers previous roasts
CREATE TABLE chat_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_query TEXT,
    uphy_response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);