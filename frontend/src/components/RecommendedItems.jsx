import { useNavigate } from "react-router-dom";

const data = [
  {
    id: 1,
    title: "Electronics",
    items: [
      { name: "Mobiles", img: "/images/recommended/mobile.jpg" },
      { name: "Laptops", img: "/images/recommended/laptop.jpg" },
      { name: "Headphones", img: "/images/recommended/headphones.jpg" },
      { name: "Cameras", img: "/images/recommended/camera.jpg" }
    ]
  },
  {
    id: 2,
    title: "Fashion",
    items: [
      { name: "Men", img: "/images/recommended/men.jpg" },
      { name: "Women", img: "/images/recommended/women.jpg" },
      { name: "Kids", img: "/images/recommended/kids.jpg" },
      { name: "Footwear", img: "/images/recommended/footwear.jpg" }
    ]
  },
  {
    id: 3,
    title: "Home & Kitchen",
    items: [
      { name: "Cookware", img: "/images/recommended/cookware.jpg" },
      { name: "Furniture", img: "/images/recommended/furniture.jpg" },
      { name: "Lighting", img: "/images/recommended/lights.jpg" },
      { name: "Storage", img: "/images/recommended/storage.jpg" }
    ]
  },
  {
    id: 4,
    title: "Beauty & Personal Care",
    items: [
      { name: "Skincare", img: "/images/recommended/skincare.jpg" },
      { name: "Haircare", img: "/images/recommended/haircare.jpg" },
      { name: "Makeup", img: "/images/recommended/makeup.jpg" },
      { name: "Fragrances", img: "/images/recommended/fragrance.jpg" }
    ]
  },
  {
    id: 5,
    title: "Sports & Fitness",
    items: [
      { name: "Gym Equipment", img: "/images/recommended/gym_equipment.jpg" },
      { name: "Yoga", img: "/images/recommended/yoga.jpg" },
      { name: "Outdoor Sports", img: "/images/recommended/basketball.jpg" },
      { name: "Wearables", img: "/images/recommended/wearables.jpg" }
    ]
  },
  {
    id: 6,
    title: "Books & Education",
    items: [
      { name: "Fiction", img: "/images/recommended/fiction_books.jpg" },
      { name: "Non-Fiction", img: "/images/recommended/non_fiction_books.jpg" },
      { name: "Exam Prep", img: "/images/recommended/exam_prep_books.jpg" },
      { name: "Children Books", img: "/images/recommended/children_books.jpg" }
    ]
  },
  {
    id: 7,
    title: "Toys & Games",
    items: [
      { name: "Action Figures", img: "/images/recommended/action_figures.jpg" },
      { name: "Board Games", img: "/images/recommended/board_games.jpg" },
      { name: "Puzzles", img: "/images/recommended/puzzles.jpg" },
      { name: "Educational Toys", img: "/images/recommended/educational_toys.jpg" }
    ]
  },
  {
    id: 8,
    title: "Automotive",
    items: [
      { name: "Car Accessories", img: "/images/recommended/car_accessories.jpg" },
      { name: "Bike Gear", img: "/images/recommended/bike_gear.jpg" },
      { name: "Tools", img: "/images/recommended/tools.jpg" },
      { name: "Car Care", img: "/images/recommended/car_care.jpg" }
    ]
  }
];

const RecommendedItems = () => {
  const navigate = useNavigate();

  const handleCategoryClick = (categoryName) => {
    navigate(`/products?category=${encodeURIComponent(categoryName.toLowerCase())}`);
  };

  const handleItemClick = (itemName) => {
    navigate(`/products?search=${encodeURIComponent(itemName)}`);
  };

  return (
    <section className="bg-gray-100 p-4">
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {data.map((card) => (
          <div
            key={card.id}
            className="bg-white p-4 flex flex-col justify-between"
          >

            <div>
              <h3 className="text-lg font-semibold mb-3">{card.title}</h3>

              <div className="grid grid-cols-2 gap-3">
                {card.items.map((item, index) => (
                  <div
                    className="cursor-pointer group"
                    key={index}
                    onClick={() => handleItemClick(item.name)}
                  >
                    <div className="overflow-hidden bg-gray-50 rounded p-1">
                      <img
                        src={item.img}
                        alt={item.name}
                        className="w-full h-24 object-contain transition-transform duration-200 group-hover:scale-105"
                      />
                    </div>
                    <p className="text-sm mt-1 group-hover:text-sky-700 transition-colors">
                      {item.name}
                    </p>
                  </div>
                ))}
              </div>
            </div>


            <button
              onClick={() => handleCategoryClick(card.title)}
              className="text-left text-sm text-sky-700 mt-4 hover:underline font-medium block w-max"
            >
              See more
            </button>
          </div>
        ))}
      </div>
    </section>
  );
};

export default RecommendedItems;