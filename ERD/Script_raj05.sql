use raj05;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `raj05` DEFAULT CHARACTER SET utf8 ;
USE `raj05` ;

-- -----------------------------------------------------
-- Table `raj05`.`Shoppers' Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raj05`.`Shoppers' Info` (
  `Shopper ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone Number` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Shopper ID`))
ENGINE = InnoDB;

-- Table `raj05`.`Pizza (Ready to eat) List`

CREATE TABLE IF NOT EXISTS `raj05`.`Pizza (Ready to eat) Menu` (
  `Pizza ID` INT NOT NULL,
  `Pizza Name` VARCHAR(45) NULL,
  `Pizza Type` VARCHAR(45) NULL,
  `R_Pizza_Price` INT NULL,
  PRIMARY KEY (`Pizza ID`))
ENGINE = InnoDB;

-- Table `raj05`.`Pizzas`

CREATE TABLE IF NOT EXISTS `raj05`.`Pizzas` (
  `Pizza ID` INT NOT NULL,
  `Pizza Size` VARCHAR(45) NULL,
  `Pizza Crust Type` VARCHAR(45) NULL,
  `Pizza Cheese Type` VARCHAR(45) NULL,
  `Pizza Sauce Type` VARCHAR(45) NULL,
  `Pizza_Price` INT NULL,
  PRIMARY KEY (`Pizza ID`))
ENGINE = InnoDB;


-- Table `raj05`.`Pizza Orders`


CREATE TABLE IF NOT EXISTS `raj05`.`Pizza Orders` (
  `Order ID` INT NOT NULL,
  `Order Date` DATE NULL,
  `Total Amount` INT NULL,
  `Shopper ID` INT NOT NULL,
  `Pizza (Ready to eat) Menu_Pizza ID` INT NOT NULL,
  `Pizzas_Pizza ID` INT NOT NULL,
  PRIMARY KEY (`Order ID`),
  INDEX `fk_Pizza Orders_Shoppers' Info_idx` (`Shopper ID` ASC) ,
  INDEX `fk_Pizza Orders_Pizza (Ready to eat) Menu1_idx` (`Pizza (Ready to eat) Menu_Pizza ID` ASC),
  INDEX `fk_Pizza Orders_Pizzas1_idx` (`Pizzas_Pizza ID` ASC) ,
  CONSTRAINT `fk_Pizza Orders_Shoppers' Info`
    FOREIGN KEY (`Shopper ID`)
    REFERENCES `raj05`.`Shoppers' Info` (`Shopper ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza Orders_Pizza (Ready to eat) Menu1`
    FOREIGN KEY (`Pizza (Ready to eat) Menu_Pizza ID`)
    REFERENCES `raj05`.`Pizza (Ready to eat) Menu` (`Pizza ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza Orders_Pizzas1`
    FOREIGN KEY (`Pizzas_Pizza ID`)
    REFERENCES `raj05`.`Pizzas` (`Pizza ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `raj05`.`Toppings`

CREATE TABLE IF NOT EXISTS `raj05`.`Toppings` (
  `Topping ID` INT NOT NULL,
  `Topping Name` VARCHAR(45) NULL,
  `price` INT NULL,
  PRIMARY KEY (`Topping ID`))
ENGINE = InnoDB;



-- Table `raj05`.`Pizza Toppings`

CREATE TABLE IF NOT EXISTS `raj05`.`Pizza Toppings` (
  `Pizza ID` INT NOT NULL,
  `Topping ID` INT NOT NULL,
  INDEX `fk_Pizza Toppings_Pizzas1_idx` (`Pizza ID` ASC) ,
  INDEX `fk_Pizza Toppings_Toppings1_idx` (`Topping ID` ASC) ,
  CONSTRAINT `fk_Pizza Toppings_Pizzas1`
    FOREIGN KEY (`Pizza ID`)
    REFERENCES `raj05`.`Pizzas` (`Pizza ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza Toppings_Toppings1`
    FOREIGN KEY (`Topping ID`)
    REFERENCES `raj05`.`Toppings` (`Topping ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `raj05`.`Sides`

CREATE TABLE IF NOT EXISTS `raj05`.`Sides` (
  `Side ID` INT NOT NULL,
  `Side Name` VARCHAR(45) NULL,
  `Order ID` INT NOT NULL,
  `Sides_price` INT NULL,
  PRIMARY KEY (`Side ID`),
  INDEX `fk_Sides_Pizza Orders1_idx` (`Order ID` ASC) ,
  CONSTRAINT `fk_Sides_Pizza Orders1`
    FOREIGN KEY (`Order ID`)
    REFERENCES `raj05`.`Pizza Orders` (`Order ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `raj05`.`Side Quantties`

CREATE TABLE IF NOT EXISTS `raj05`.`Side Quantties` (
  `Side Quantity` INT NOT NULL,
  `Side ID` INT NOT NULL,
  `Order ID` INT NOT NULL,
  INDEX `fk_Side Quantties_Sides1_idx` (`Side ID` ASC) ,
  INDEX `fk_Side Quantties_Pizza Orders1_idx` (`Order ID` ASC) ,
  CONSTRAINT `fk_Side Quantties_Sides1`
    FOREIGN KEY (`Side ID`)
    REFERENCES `raj05`.`Sides` (`Side ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Side Quantties_Pizza Orders1`
    FOREIGN KEY (`Order ID`)
    REFERENCES `raj05`.`Pizza Orders` (`Order ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




-- Data For the tables 
use raj05;
-- Added data into Shoppers table
INSERT INTO `Shoppers' Info` (`Shopper ID`, `Name`, `Address`, `Phone Number`, `Email`)
VALUES
    (1, 'Krutik Patel', '45 Lancaster ave', 9558856622, 'k18@example.com'),
    (2, 'Yashraj Raj', '446 Robert Ferrie', 9988774468, 'ryashraj1818@example.com'),
    (3, 'Dhruv Patel', '77 Ottawa St.', 9125698441, 'pdhruv07@example.com'),
    (4, 'Rutvik Italiya', '89 Fairview Ln', 9876543210, 'Rut08@example.com'),
    (5, 'Vrusang Patel', '18 downtown King St', 5559876543, 'vpate08@example.com'),
    (6, 'Hardki Thakor', '97 victoria Ave', 9876543210, 'hardik09@example.com'),
    (7, 'Keyu Patel', '21 Ottawa London Rd', 5551234567, 'keyu01@example.com'),
    (8, 'Nisarg Ghevariya', '30 Maple St', 9876543210, 'nisarg07@example.com'),
    (9, 'Virat Kohli', '1818 Sarojni chowk, Delhi', 5559876543, 'Virat18@example.com'),
    (10, 'Rohit Sharma', '4545 Main St, Mumbai', 9876543210, 'rohit45@example.com');

-- Added data for (Ready to eat) in menu table
INSERT INTO `Pizza (Ready to eat) Menu` (`Pizza ID`, `Pizza Name`, `Pizza Type`, `R_Pizza_Price`)
VALUES
    (1, 'Pizza Margherita', 'Vegetarian', 499),
    (2, 'Double Cheese Margherita', 'Vegetarian', 699),
    (3, 'Tandoori Paneer Pizza', 'Vegetarian', 599),
    (4, 'Cheese Corn & Jalapeno', 'Vegetarian', 399),
    (5, '5 Cheese Pizza', 'Vegetarian', 499),
    (6, 'Veggie Wonder', 'Specialty', 399),
    (7, 'Premium Single Toppings', 'Specialty', 499),
    (8, 'Overloaded Pizza', 'Vegetarian', 329),
    (9, 'Paneer Supreme', 'Vegetarian', 399),
    (10, 'Veggie Lovers', 'Specialty', 499);

-- Insert data into Pizzas table
INSERT INTO `Pizzas` (`Pizza ID`, `Pizza Size`, `Pizza Crust Type`, `Pizza Cheese Type`, `Pizza Sauce Type`, `Pizza_Price`)
VALUES
    (1, 'Medium', 'Thin Crust', 'Mozzarella', 'Tomato Sauce', 99),
    (2, 'Large', 'Pan Crust', 'Cheddar', 'BBQ Sauce', 109),
    (3, 'Small', 'Regular Crust', 'Parmesan', 'Pesto Sauce', 79),
    (4, 'Large', 'Stuffed Crust', 'Mixed', 'Garlic Butter Sauce', 89),
    (5, 'Medium', 'Thin Crust', 'Mozzarella', 'Tomato Sauce', 99),
    (6, 'Large', 'Pan Crust', 'Cheddar', 'BBQ Sauce', 199),
    (7, 'Large', 'Stuffed Crust', 'Mixed', 'Garlic Butter Sauce', 599),
    (8, 'Medium', 'Thin Crust', 'Mozzarella', 'Tomato Sauce', 299),
    (9, 'Large', 'Pan Crust', 'Cheddar', 'Pesto Sauce', 399),
    (10, 'Large', 'Stuffed Crust', 'Mixed', 'Garlic Butter Sauce', 499);

-- Insert data into Pizza Orders table
INSERT INTO `Pizza Orders` (`Order ID`, `Order Date`, `Total Amount`, `Shopper ID`, `Pizza (Ready to eat) Menu_Pizza ID`, `Pizzas_Pizza ID`)
VALUES
    (1, '2023-12-01', 2098, 1, 1, 1),
    (2, '2023-12-02', 2598, 2, 2, 2),
    (3, '2023-12-03', 1799, 3, 3, 3),
    (4, '2023-12-04', 2199, 4, 4, 4),
    (5, '2023-12-05', 1698, 5, 5, 5),
    (6, '2023-12-06', 1698, 6, 6, 6),
    (7, '2023-12-07', 1998, 7, 7, 7),
    (8, '2023-12-08', 1798, 8, 8, 8),
    (9, '2023-12-09', 2098, 9, 9, 9),
    (10, '2023-12-10', 2298, 10, 10, 10);

-- Insert data into Toppings table
INSERT INTO `Toppings` (`Topping ID`, `Topping Name`, `price`)
VALUES
    (1, 'Mushrooms', 100),
    (2, 'Olives', 75),
    (3, 'Onions', 50),
    (4, 'Bell Peppers', 60),
    (5, 'Pepperoni', 90),
    (6, 'Bacon', 100),
    (7, 'Tomatoes', 70),
    (8, 'Spinach', 60),
    (9, 'Pineapple', 70),
    (10, 'Jalapenos', 50);

-- Insert data into Pizza Toppings table
INSERT INTO `Pizza Toppings` (`Pizza ID`, `Topping ID`)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10);

-- Insert data into Sides table
INSERT INTO `Sides` (`Side ID`, `Side Name`, `Order ID`, `Sides_price`)
VALUES
    (1, 'Garlic Bread', 1, 99),
    (2, 'Salad', 2, 49),
    (3, 'Fries', 3, 99),
    (4, 'Breadsticks', 4, 99),
    (5, 'Cheese Sticks', 5, 99),
    (6, 'Onion Rings', 6, 49),
    (7, 'Potato Wedges', 7, 99),
    (8, 'Mozzarella Sticks', 8, 99),
    (9, 'Mixed Vegetables', 9, 99),
    (10, 'Chicken Tenders', 10, 49);



