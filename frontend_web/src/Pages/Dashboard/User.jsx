import React, { useState, useEffect, useRef } from "react";
import api from "../../config";
import axios from "axios";
import { useParams } from 'react-router-dom';


const User = ({ isAuth }) => {
  const [user, setUser] = useState(null);
  const { userId } = useParams();

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const response = await axios.get(`${api}/user/${userId}`);
        console.log(response.data);
        setUser(response.data);
      } catch (error) {
        console.error(error);
      }
    };

    fetchUser();
  }, [userId]);


  return (
    // <div className="md:bg-[#4F5AF5]">
    //   <div className="p-3 md:rounded-l-[65px] bg-[#ECF2FB] md:h-screen md:w-full w-screen flex flex-col overflow-hidden">

    <div className="flex flex-col justify-between items-center space-y-6 h-full">
      <div className="md:flex  flex-col justify-between w-full px-10 md:space-y-0 space-y-5">
        <div className="bg-[#001d32] text-[#ffffff] w-[12%] font-bold flex items-center justify-center rounded p-2 m-2">
          SME Listing
        </div>
        <div className="grid grid-row-2 grid-cols-2 py-4 gap-4">
          <div className="flex gap-8"><b>Company Name:</b> {user?.company_name}</div>
          <div className="flex gap-8"><b>Registration Number:</b>  {user?.registration_number}</div>
          <div className="flex gap-8"><b>Industry Type:</b>  {user?.industry}</div>
          <div className="flex gap-8"><b>Credit Score:</b>  {user?.financials.credit_score}</div>
        </div>
        <div className="bg-[#FDFFFF] md:w-[40%] p-3 text-black shadow-xl rounded-3xl ">
          <h1 className="text-xl font-bold pb-2">Card Details</h1>
          <div className="relative  rounded-3xl h-[40vh] p-8 flex flex-col justify-center">
            <img
              src={"/assets/card.png"}
              alt="mask"
              className="absolute top-0 left-0"
              width={400}
            />
            <h4 className=" pl-4 z-10 relative m-0 p-0 text-sm text-white">
              Card Holder<br />
              <p className="text-xl md:text-xl m-0 py-0 pb-8 font-bold">{user?.username}</p>
            </h4>
          </div>
          {/* <hr className=" rotate-90 bg-[#001d32] w-[10vw]" /> */}
          <div className="overflow-x-auto text-[#000000] flex items-center justify-center pt-4">
            {/* <table className="table-auto">
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
                  <tr key={user._id}>
                    <td className="border px-[3.5vw] py-3">{user.company_name}</td>
                    <td className="border px-[3.5vw] py-3">{user.registration_number}</td>
                    <td className="border px-[3.5vw] py-3">{user.industry}</td>
                    <td className="border px-[3.5vw] py-3">{user.username}</td>
                    <td className="border px-[3.5vw] py-3">{user.financials.credit_score}</td>
                  </tr>
                ))}
              </tbody>
            </table> */}
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

export default User;
