import React, { useState, useEffect } from "react";
import { Link, redirect, useLocation } from "react-router-dom";
// import Credit from "../../Components/creditModal";
// import { fetchUserDetailsService } from "../../service/user";


export default function Header({ setIsAuth }) {
  const location = useLocation();
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  // const [isCreditModalOpen, setIsCreditModalOpen] = useState(false);
  // const [userData, setUserData] = useState({});
  const [title, setTitle] = useState()
  useEffect(() => {
    setTitle(getTitleFromLocation(location.pathname));
  }, [location.pathname])

  const getTitleFromLocation = (path) => {
    switch (path) {
      case "/":
        return "Admin Panel";
      case "/loan-application":
        return "Loan Application";
      // case "/translate":
      //   return t('translate');
      // case "/report":
      //   return t('report');
      // case "/social-media":
      //   return t('socialMedia');
      // case "/tell-me":
      //   return t('tellMe');
      // case "/history":
      //   return t('history');
      // case "/profile":
      //   return t('profilePage');
      default:
        return "Admin Panel";
    }
  }
  // const openCreditModal = () => {
  //   setIsCreditModalOpen(true);
  // };

  // const closeCreditModal = () => {
  //   setIsCreditModalOpen(false);
  // };


  const tokenCheck = () => {
    const token = localStorage.getItem("token");
    if (!token) {
      setIsAuth(false);
      localStorage.removeItem("token");
      toast.error("Session expired. Please login again.");
      return;
    }
  }
  // const fetchProfile = async () => {
  //   try {
  //     const token = localStorage.getItem("token");
  //     if (!token) {
  //       setIsAuth(false);
  //       localStorage.removeItem("token");
  //       toast.error("Session expired. Please login again.");
  //       return;
  //     }
  //     const data = await fetchUserDetailsService();
  //     if (data) {
  //       setUserData(data);
  //     }
  //   } catch (error) {
  //     console.error("Failed to fetch profile data:", error);
  //   } finally {
  //     console.log("Profile data fetched successfully");
  //   }
  // };

  // useEffect(() => {
  //   fetchProfile();
  // }, []);

  useEffect(() => {
    tokenCheck();
  }, []);
  return (
    <div className="pt-10 pb-3 rounded-l-3xl bg-[#cde5ff] md:w-full w-screen">
      <div className="px-5 w-[80vw] flex justify-between gap-5 items-center">
        <div className="flex justify-start text-[#000000] font-semibold">
          <div className="flex flex-col gap-3">
            <h4 className="md:text-3xl">{title}</h4>
            <h4 className="md:text-sm text-[#0076b5]">Get the summary of all the applicants at one place.</h4>

          </div>
        </div>
        <div className="flex justify-between gap-3">
          {/* <button
            onClick={openCreditModal}
            className="rounded-full bg-[#facc15] text-white px-5 py-1.5 font-semibold  hover:shadow-xl transition duration:300"
          >
            {t('credits')}
          </button>
          <Link
            to="/history"
            className="rounded-full bg-[#4F5AF5] text-white px-5 py-2.5 font-semibold hover:shadow-xl transition duration:300"
          >
            {t('history')}
          </Link> */}
          <button
            className="rounded-full bg-white shadow p-0.5"
            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
          >

            <div className="relative w-11 h-11 rounded-full overflow-hidden bg-white">
              <img
                src={"assets/dummy-pofile.webp"}
                alt="profile"
                className="object-cover w-full h-full rounded-full"
              />
            </div>
          </button>
          {isDropdownOpen && (
            <div className="absolute right-0 mt-12 mr-5 w-30 text-sm bg-white rounded-md shadow-lg z-10">
              <Link
                to="/profile"
                className="block px-4 py-3 text-gray-800 hover:bg-gray-100"
                onClick={() => setIsDropdownOpen(false)}
              >
                Profile Page
              </Link>
              <Link
                to='/'
                className="block w-full text-left px-4 py-3 text-gray-800 hover:bg-gray-100"
                onClick={() => {
                  setIsAuth(false);
                  console.log("Logout");
                  localStorage.removeItem("token");
                }}
              >
                Logout
              </Link>
            </div>
          )}
          {/* {isCreditModalOpen && <Credit onClose={closeCreditModal} />} */}
        </div>
      </div>
    </div>
  );
}
