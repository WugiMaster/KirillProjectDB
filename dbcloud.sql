CREATE TABLE IF NOT EXISTS "games" (
	"game_id" INTEGER NOT NULL,
	"dev_id" INTEGER NOT NULL,
	"genre_id" INTEGER NOT NULL,
	"title" TEXT NOT NULL,
	"price" REAL NOT NULL,
	PRIMARY KEY("game_id"),
	FOREIGN KEY ("dev_id") REFERENCES "developers"("dev_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("genre_id") REFERENCES "genres"("genre_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "developers" (
	"dev_id" INTEGER NOT NULL,
	"name" TEXT NOT NULL,
	"country" TEXT,
	PRIMARY KEY("dev_id")
);

CREATE TABLE IF NOT EXISTS "orders" (
	"order_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL,
	"total_price" REAL NOT NULL,
	PRIMARY KEY("order_id"),
	FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "genres" (
	"genre_id" INTEGER NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"description" TEXT,
	PRIMARY KEY("genre_id")
);

CREATE TABLE IF NOT EXISTS "discounts" (
	"discount_id" INTEGER NOT NULL,
	"game_id" INTEGER NOT NULL,
	"discount_percent" INTEGER NOT NULL,
	"end_date" TEXT,
	PRIMARY KEY("discount_id"),
	FOREIGN KEY ("game_id") REFERENCES "games"("game_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "users" (
	"user_id" INTEGER NOT NULL,
	"username" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"balance" REAL NOT NULL,
	PRIMARY KEY("user_id")
);

CREATE TABLE IF NOT EXISTS "orderitems" (
	"item_id" INTEGER NOT NULL,
	"game_id" INTEGER NOT NULL,
	"order_id" INTEGER NOT NULL,
	"price" REAL NOT NULL,
	PRIMARY KEY("item_id"),
	FOREIGN KEY ("order_id") REFERENCES "orders"("order_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("game_id") REFERENCES "games"("game_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "library" (
	"library_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL UNIQUE,
	"game_id" INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("library_id"),
	FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("game_id") REFERENCES "games"("game_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "reviews" (
	"review_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL,
	"game_id" INTEGER NOT NULL,
	"rating" INTEGER NOT NULL,
	PRIMARY KEY("review_id"),
	FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("game_id") REFERENCES "games"("game_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "payments" (
	"payment_id" INTEGER NOT NULL,
	"order_id" INTEGER NOT NULL,
	"amount" REAL NOT NULL,
	"payment_method" TEXT NOT NULL,
	PRIMARY KEY("payment_id"),
	FOREIGN KEY ("order_id") REFERENCES "orders"("order_id")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);
