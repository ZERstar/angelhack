import { useNavigate } from 'react-router-dom';
import React, { useState, useEffect, useRef } from "react";
import Header from "./Header";
// import { toast } from "react-toastify";
// import { fetchUserDetailsService, updateProfileService } from "../../service/user";
import { FaExternalLinkAlt } from "react-icons/fa";
// import { useTranslation } from 'react-i18next';
// import HomeModal from "../../Components/homeModal";
import api from "../../config";
import { getUsers } from "../../service/user";
import axios from "axios";
import { Link } from "react-router-dom";
import { Navigate } from "react-router-dom";


const Home = ({ setIsAuth }) => {
  // const { t } = useTranslation();
  const [userData, setUserData] = useState([]);
  const [modalTitle, setModalTitle] = useState("");
  const [showModal, setShowModal] = useState(false);

  const fetchAllUsers = async () => {
    try {
      axios.get(`${api}/user`).then((res) => {
        console.log("res", res);
        setUserData(res.data);
      });

    } catch (error) {
      console.error("Failed to fetch profile data:", error);
    } finally {
      console.log("Profile data fetched successfully");
    }
  };

  useEffect(() => {
    fetchAllUsers();
  }, []);

  const navigate = useNavigate();

  // const openModal = (title) => {
  //   setModalTitle(title);
  //   setShowModal(true);
  // };

  // const closeModal = () => {
  //   setShowModal(false);
  // };


  return (
    // <div className="md:bg-[#4F5AF5]">
    //   <div className="p-3 md:rounded-l-[65px] bg-[#ECF2FB] md:h-screen md:w-full w-screen flex flex-col overflow-hidden">

    <div className="flex flex-col justify-between items-center space-y-6 h-full">
      <div className="md:flex justify-between w-full px-10 md:space-y-0 space-y-5">
        <div className="bg-[#FDFFFF] md:w-[100%] p-3 text-white shadow-xl rounded-3xl shadow-[#aacae0]">
          <div className="bg-[#cde5ff] text-[#0076b5] w-[12%] font-bold flex items-center justify-center rounded p-2 m-2">
            SME Listing
          </div>
          <div className="overflow-x-auto text-[#000000] flex items-center justify-center pt-4">
            <table className="table-auto">
              <thead>
                <tr>
                  <th className="px-[3.5vw] py-3">Company Name</th>
                  <th className="px-[3.5vw] py-3">Registration Number</th>
                  <th className="px-[3.5vw] py-3">Industry Type</th>
                  <th className="px-[3.5vw] py-3">Owner</th>
                  <th className="px-[3.5vw] py-3">Credit Score</th>

                </tr>
              </thead>
              <tbody>
                {userData.map((user) => (
                  <tr className=" cursor-pointer" onClick={(e) => { e.preventDefault(); navigate(`/user-profile/${user._id}`) }} key={user._id}>
                    <td className="border px-[3.5vw] py-3">{user.company_name}</td>
                    <td className="border px-[3.5vw] py-3">{user.registration_number}</td>
                    <td className="border px-[3.5vw] py-3">{user.industry}</td>
                    <td className="border px-[3.5vw] py-3">{user.username}</td>
                    <td className="border px-[3.5vw] py-3">{user.financials.credit_score}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {/* <div className="relative bg-gradient-to-r from-[#6874FF] to-[#404DE0] shadow-lg rounded-3xl h-full p-8 flex flex-col justify-center space-y-2"> */}
          {/* <h1 className="text-2xl md:text-3xl font-bold">
              {t('welcome', )}
            </h1> */}
          {/* <p className="text-lg md:text-xl font-bold">{t('companyName')}</p> */}
          {/* <p className="text-sm md:text-base font-regular w-full md:w-1/2 text-left">
              {t('slogan')}
            </p> */}
          {/* <img
              src={"assets/maskedCircle.png"}
              alt="mask"
              className="absolute bottom-0 right-0"
              width={150}
              style={{ opacity: 0.4 }}
            /> */}
          {/* </div> */}
        </div>

      </div>

      <div className="flex justify-center pb-6">

      </div>
    </div>
    //   </div>
    // </div>
  );
};

export default Home;
