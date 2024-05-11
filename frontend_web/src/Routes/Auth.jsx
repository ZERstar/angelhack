import React from 'react'
import { Route, Routes } from "react-router-dom";
import SignIn from '../Pages/Auth/Signin';

const Auth = ({ setIsAuth }) => {
    return (
        <>
            <Routes>
                <Route index element={<SignIn setIsAuth={setIsAuth} />} />
            </Routes>
        </>
    )
}

export default Auth