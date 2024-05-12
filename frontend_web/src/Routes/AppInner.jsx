import React, { useState, useEffect } from 'react'
import { Route, Routes, useNavigate } from "react-router-dom";
// import Home from '../Pages/Dashboard/Home';
import Sidebar from '../components/Sidebar';
import Home from '../Pages/Dashboard/Home';
import Header from '../Pages/Dashboard/Header';
// import Email from '../Pages/Dashboard/Email';
// import Translate from '../Pages/Dashboard/Translate';
// import Report from '../Pages/Dashboard/Report';
// import SocialMedia from '../Pages/Dashboard/SocialMedia';
// import TellMe from '../Pages/Dashboard/TellMe';
// import History from '../Pages/Dashboard/History';

// import Profile from '../Pages/Dashboard/Profile';
// import Header from '../Pages/Dashboard/Header';

const AppInner = ({ setIsAuth }) => {
    const [selectedFilter, setSelectedFilter] = useState(null);
    const navigate = useNavigate();

    useEffect(() => {
        const token = localStorage.getItem("token");
        if (token) {
            setIsAuth(true);
        } else {
            setIsAuth(false);
            console.log("Session expired. Please login again.");
            navigate("/");
        }
    }, [navigate]);

    return (
        <div className='flex'>
            <Sidebar />

            <div className="md:bg-[#ffffff]">
                <div className="p-4 md:rounded-l-[65px] bg-[#cde5ff] md:h-screen md:w-full w-screen flex flex-col overflow-hidden">
                    <Header setIsAuth={setIsAuth} />
                    <Routes>
                        <Route index element={<Home setIsAuth={setIsAuth} />} />
                        {/* <Route path='/email-generate' element={<Email setIsAuth={setIsAuth} />} />
                        <Route path='/translate' element={<Translate setIsAuth={setIsAuth} />} />
                        <Route path='/report' element={<Report setIsAuth={setIsAuth} />} />
                        <Route path='/social-media' element={<SocialMedia setIsAuth={setIsAuth} />} />
                        <Route path='/tell-me' element={<TellMe setIsAuth={setIsAuth} />} />
                        <Route path='/history' element={<History setIsAuth={setIsAuth} selectedFilter={selectedFilter} setSelectedFilter={setSelectedFilter} />} />
                        <Route path='/profile' element={<Profile setIsAuth={setIsAuth} />} /> */}
                    </Routes>
                </div>
            </div>
        </div>
    )
}

export default AppInner