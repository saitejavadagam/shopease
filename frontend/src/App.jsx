import { lazy, useEffect } from 'react'
import Navbar from './components/Navbar'
import { Routes, Route } from 'react-router-dom'
import Footer from './components/Footer';
import { useCartStore } from './store/useCartStore';
import ProtectedRoute from "./components/ProtectedRoute";
import { useAuthStore } from './store/useAuthStore';

import Loader from './components/Loader';
import Profile from './pages/Profile';
import SuspenseLoader from './components/SuspenseLoader';

const Home = lazy(() => import("./pages/Home"));
const Cart = lazy(() => import("./pages/Cart"));
const Contact = lazy(() => import("./pages/Contact"));
const Products = lazy(() => import("./pages/Products"));
const ProductView = lazy(() => import("./pages/ProductView"));
const Login = lazy(() => import("./pages/Login"));
const Signup = lazy(() => import("./pages/Signup"));
const Orders = lazy(() => import("./pages/Orders"));

const App = () => {

  const fetchCart = useCartStore(state => state.fetchCart);
  const token = useAuthStore(state => state.token);

  useEffect(() => {
    if (token) fetchCart();
  }, [token, fetchCart]);


  return (
    <div>

      <Navbar />

      <Routes>

        <Route path="/" element={
          <SuspenseLoader children={<Home />} message="Loading home page" />
        } />

        <Route path='/login' element={
          <SuspenseLoader children={<Login />} message="Loading login page" />
        } />

        <Route path='/signup' element={
          <SuspenseLoader children={<Signup />} message="Loading signup page" />
        } />

        <Route element={<ProtectedRoute />}>
          <Route path="/cart" element={
            <SuspenseLoader children={<Cart />} message="Loading cart page" />
          } />
          <Route path="/profile" element={
            <SuspenseLoader children={<Profile />} message="Loading profile page" />
          } />
          <Route path="/products" element={
            <SuspenseLoader children={<Products />} message="Loading products page" />
          } />
          <Route path="/products/:id" element={
            <SuspenseLoader children={<ProductView />} message="Loading products page" />
          } />
          <Route path="/orders" element={
            <SuspenseLoader children={<Orders />} message="Loading orders page" />
          } />
          <Route path="/contact" element={
            <SuspenseLoader children={<Contact />} message="Loading contact page" />
          } />
        </Route>

      </Routes>

      <Footer />
    </div>
  )
}

export default App