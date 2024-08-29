CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID as the primary key
    name VARCHAR(100) NOT NULL,  -- Name of the user
    height INTEGER CHECK (height > 0),  -- Height in centimeters (positive integer)
    mass DECIMAL(5, 2) CHECK (mass > 0),  -- Mass in kilograms (positive decimal)
    hair_color VARCHAR(50),  -- Hair color of the user
    skin_color VARCHAR(50),  -- Skin color of the user
    eye_color VARCHAR(50),  -- Eye color of the user
    birth_year VARCHAR(10),  -- Birth year of the user
    gender VARCHAR(50)  -- Gender of the user
);