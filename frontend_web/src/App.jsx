import { useState, useEffect } from 'react'
import { Route, Routes, useNavigate } from "react-router-dom";

import './App.css'
import Auth from './Routes/Auth';
import AppInner from './Routes/AppInner';

function App() {
  const [isAuth, setIsAuth] = useState(false);

  return (
    <>
      <Routes>
        {!isAuth ? (
          <Route path="/*" element={<Auth setIsAuth={setIsAuth} />} />
        ) : (
          <Route path="/*" element={<AppInner setIsAuth={setIsAuth} />} />
        )}
      </Routes>

    </>
  )
}

export default App
