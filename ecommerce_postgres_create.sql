CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"category" TEXT NOT NULL,
	"sizeId" TEXT NOT NULL,
	"mainImageId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"address" TEXT NOT NULL,
	"purchaseDate" TIMESTAMP NOT NULL DEFAULT 'Now()',
	"total" integer NOT NULL,
	"status" integer NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orderProducts" (
	"id" serial NOT NULL,
	"orderId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "orderProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.statusCategories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "statusCategories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("mainImageId") REFERENCES "images"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("status") REFERENCES "statusCategories"("id");

ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk0" FOREIGN KEY ("orderId") REFERENCES "orders"("id");
ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");












