import { apiFetch } from "../api/client";
import ProductCard from "../components/ProductCard";
import { useState, useEffect, useMemo, useCallback } from 'react';
import { useCartStore } from "../store/useCartStore";
import { useSearchParams } from "react-router-dom";
import debounce from "lodash.debounce";

const Products = () => {
    const [searchParams, setSearchParams] = useSearchParams();
    
    const search = searchParams.get("search") || "";
    const category = searchParams.get("category") || "";
    const subcategory = searchParams.get("subcategory") || "";
    const page = parseInt(searchParams.get("page") || "0", 10);
    const size = parseInt(searchParams.get("size") || "5", 10);

    const [productsPage, setProductsPage] = useState({
        products: [],
        currentPage: 0,
        totalPages: 0,
        totalElements: 0,
    });

    const cart = useCartStore((state) => state.cart?.items || []);
    const addItem = useCartStore((state) => state.addItem);
    const removeItem = useCartStore((state) => state.removeItem);


    useEffect(() => {
        const p = searchParams.get("page");
        const s = searchParams.get("size");
        if (p === null || s === null) {
            const nextParams = {};
            if (search) nextParams.search = search;
            if (category) nextParams.category = category;
            if (subcategory) nextParams.subcategory = subcategory;
            nextParams.page = "0";
            nextParams.size = size.toString();
            
            setSearchParams(nextParams);
        }
    }, [search, category, subcategory, size, searchParams, setSearchParams]);


    const fetchProducts = useCallback(async () => {
        try {
            const queryParams = new URLSearchParams();
            if (search) queryParams.append("search", search);
            if (category) queryParams.append("category", category);
            if (subcategory) queryParams.append("subcategory", subcategory);
            queryParams.append("page", page.toString());
            queryParams.append("size", size.toString());

            const data = await apiFetch(`api/products?${queryParams.toString()}`);
            setProductsPage(data);
        } catch (err) {
            console.error("Failed to fetch products", err);
        }
    }, [search, category, subcategory, page, size]);

    useEffect(() => {
        window.scrollTo({ top: 0, behavior: "smooth" });
    }, [page]);

    const debouncedFetch = useMemo(() => {
        return debounce(() => {
            fetchProducts();
        }, 300);
    }, [fetchProducts]);

    useEffect(() => {
        debouncedFetch();
        return () => {
            debouncedFetch.cancel();
        };
    }, [debouncedFetch]);


    const handlePageChange = (newPage) => {
        const nextParams = {};
        if (search) nextParams.search = search;
        if (category) nextParams.category = category;
        if (subcategory) nextParams.subcategory = subcategory;
        nextParams.page = newPage.toString();
        nextParams.size = size.toString();

        setSearchParams(nextParams);
    };

    return (
        <div className="max-w-7xl mx-auto px-4">
            <div>{/* Filters side bar */}</div>

            <div className="grid gap-4 mt-6">
                {productsPage.products.map((product) => {
                    const cartItem = cart.find(item => item.productId === product.id);
                    const quantity = cartItem ? cartItem.quantity : 0;

                    return (
                        <ProductCard
                            key={product.id} // Use unique database keys instead of list indexes
                            product={product}
                            addItem={addItem}
                            removeItem={removeItem}
                            quantity={quantity}
                        />
                    );
                })}
            </div>

            {productsPage.totalPages > 1 && (
                <div className="flex justify-center items-center gap-2 my-6">
                    <button
                        disabled={productsPage.currentPage === 0}
                        onClick={() => handlePageChange(productsPage.currentPage - 1)}
                        className="px-3 py-1 bg-gray-200 rounded disabled:opacity-50 font-medium hover:bg-gray-300 transition-colors"
                    >
                        prev
                    </button>

                    {Array.from({ length: productsPage.totalPages }).map((_, i) => (
                        <button
                            key={i}
                            onClick={() => handlePageChange(i)}
                            className={`px-3 py-1 rounded font-medium transition-colors ${
                                i === productsPage.currentPage 
                                ? "bg-blue-600 text-white" 
                                : "bg-gray-200 hover:bg-gray-300"
                            }`}
                        >
                            {i + 1}
                        </button>
                    ))}

                    <button
                        disabled={productsPage.currentPage === productsPage.totalPages - 1}
                        onClick={() => handlePageChange(productsPage.currentPage + 1)}
                        className="px-3 py-1 bg-gray-200 rounded disabled:opacity-50 font-medium hover:bg-gray-300 transition-colors"
                    >
                        Next
                    </button>
                </div>
            )}
        </div>
    );
};

export default Products;