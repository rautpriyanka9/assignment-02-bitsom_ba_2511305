// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
  {
    product_id: 101,
    name: "Samsung LED TV",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      screen_size: "43 inch"
    },
    available_colors: ["Black"],
    ratings: {
      average: 4.5,
      reviews: 120
    }
  },

  {
    product_id: 201,
    name: "Men T-Shirt",
    category: "Clothing",
    price: 799,
    brand: "Nike",
    sizes: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Red", "Blue", "Black"],
    stock: {
      warehouse: 50,
      store: 20
    }
  },

  {
    product_id: 301,
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry: ISODate("2024-12-01"),
    nutrition: {
      calories: 150,
      protein: "8g",
      fat: "5g"
    },
    storage: {
      temperature: "4C",
      type: "Refrigerated"
    },
    tags: ["dairy", "fresh", "organic"]
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry: { $lt: ISODate("2025-01-01") }
});


// OP4: updateOne() — add discount_percent field

db.products.updateOne(
  { product_id: 101 },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category

db.products.createIndex({ category: 1 });

// This index improves search performance when filtering by category