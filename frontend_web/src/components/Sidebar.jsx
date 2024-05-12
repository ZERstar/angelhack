import React, { useState, useEffect } from "react";
import { Link, NavLink, useLocation } from "react-router-dom";
import { GoHome, GoMail, GoSearch } from "react-icons/go";
import { RiTranslate } from "react-icons/ri";
import { BiSolidReport } from "react-icons/bi";
import { TbSocial } from "react-icons/tb";
import { AiOutlineClose } from "react-icons/ai";
// import { useTranslation } from 'react-i18next';

const Sidebar = () => {
  const location = useLocation();
  // const { t } = useTranslation();
  const onClose = (e) => {
    if (e.target === e.currentTarget) setSidebarOpen(false);
  };
  const [isSidebarOpen, setSidebarOpen] = useState(false);

  const toggleSidebar = () => {
    setSidebarOpen(!isSidebarOpen);
  };

  return (
    <div
      className={"bg-[#FFFFFF] text-black xl:w-[22vw] md:w-[100vw] h-screen"}
      onClick={onClose}
    >

      <div className="hidden md:flex flex-col justify-around h-full">
        <div>
          <Link to="" className="flex justify-center items-start pb-5">
            <img
              src={"assets/logo.png"}
              alt="logo"
              width={150}
            />
          </Link>
          <div className="flex justify-center w-full">
            <div className="w-3/4 h-[0.5px] bg-neutral-300"></div>
          </div>
        </div>
        <div className="flex flex-col items-end space-y-5">
          <div className="flex flex-col space-y-5 xl:w-4/5 w-full">
            <NavLink
              exact
              to="/"
              className={`focus:text-[#0076b5] xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/" ? "bg-[#ECF2FB] text-[#0076b5]" : ""}`}
              activeClassName="bg-[#ECF2FB] text-[#0076b5]"
            >
              <GoHome size={20} />
              <span>Home</span>
            </NavLink>
            <NavLink
              to="/loan-application"
              className={`focus:text-[#0076b5] xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/email-generate" ? "bg-[#ECF2FB] text-[#0076b5]" : ""}`}
              activeClassName="bg-[#ECF2FB] text-[#0076b5]"
            >
              <GoMail size={20} />
              <span>Loan Application</span>
            </NavLink>
            {/* <NavLink
              to="/translate"
              className={`focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/translate" ? "bg-[#ECF2FB] text-orange-500" : ""}`}
              activeClassName="bg-[#ECF2FB] text-orange-500"
            >
              <RiTranslate size={20} />
              <span>{t('translate')}</span>
            </NavLink> */}
            {/* <NavLink
              to="/report"
              className={`focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/report" ? "bg-[#ECF2FB] text-orange-500" : ""}`}
              activeClassName="bg-[#ECF2FB] text-orange-500"
            >
              <BiSolidReport size={20} />
              <span>{t('report')}</span>
            </NavLink> */}
            {/* <NavLink
              to="/social-media"
              className={`focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/social-media" ? "bg-[#ECF2FB] text-orange-500" : ""}`}
              activeClassName="bg-[#ECF2FB] text-orange-500"
            >
              <TbSocial size={20} />
              <span>{t('socialMedia')}</span>
            </NavLink> */}
          </div>
        </div>
        <div className="flex flex-col items-end">
          <div className="flex flex-col space-y-5 xl:w-4/5 w-full">
            {/* <NavLink
              to="/tell-me"
              className={`focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5 ${location.pathname === "/tell-me" ? "bg-[#ECF2FB] text-orange-500" : ""}`}
              activeClassName="bg-[#ECF2FB] text-orange-500"
            >
              <GoSearch size={20} />
              <span>{t('tellMe')}</span>
            </NavLink> */}
          </div>
        </div>

        <div className="flex justify-center w-full">
          <div className="w-3/4 flex border border-dashed border-neutral-400 shadow-inner flex-col space-y-2 rounded-xl p-3 justify-center  bg-[#cde5ff] ">
            <div className="flex items-center gap-2">
              <img src="assets/phone.png" alt="" width={20} />
              <div>
                <h1 className="font-bold text-xs">Phone</h1>
                <p className="text-xs">+36 30 153 3386</p>
              </div>
            </div>
            <div className="flex items-center gap-2">
              <img src="assets/mail.png" alt="" width={20} />
              <div>
                <h2 className="font-bold text-xs">Email</h2>
                <p className="text-xs">info@saadhan.in</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* mobile sidebar  */}
      {/* <div
        className={`${isSidebarOpen ? "translate-x-0" : "-translate-x-full"
          } md:hidden h-screen fixed top-0 left-0 z-50 bg-[#4F5AF5] w-[80vw] transition duration:500`}
        onClick={onClose}
      >
        <button
          className="md:hidden block absolute top-9 left-6 text-white text-2xl"
          onClick={toggleSidebar}
        >
          <AiOutlineClose size={15} />
        </button>
        
        <div className="flex flex-col justify-around h-screen">
          <div>
            <Link to="" className="flex justify-center items-start pb-5">
              <img
                src={process.env.PUBLIC_URL + "assets/logoSignup.png"}
                alt="logo"
                width={180}
              />
            </Link>
            <div className="flex justify-center w-full">
              <div className="w-3/4 h-[0.5px] bg-neutral-300"></div>
            </div>
          </div>
          <div className="flex flex-col items-end space-y-5">
            <div className="flex flex-col space-y-5 xl:w-4/5 w-full">
              <NavLink
                exact
                to="/"
                onClick={toggleSidebar}
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
              >
                <GoHome size={20} />
                <span>{t('home')}</span>
              </NavLink>
              <NavLink
                to="/email-generate"
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
                onClick={toggleSidebar}
              >
                <GoMail size={20} />
                <span>{t('emailGeneration')}</span>
              </NavLink>
              <NavLink
                to="/translate"
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
                onClick={toggleSidebar}
              >
                <RiTranslate size={20} />
                <span>{t('translate')}</span>
              </NavLink>
              <NavLink
                to="/report"
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
                onClick={toggleSidebar}
              >
                <BiSolidReport size={20} />
                <span>{t('report')}</span>
              </NavLink>
              <NavLink
                to="/social-media"
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
                onClick={toggleSidebar}
              >
                <TbSocial size={20} />
                <span>{t('socialMedia')}</span>
              </NavLink>
            </div>
          </div>
          <div className="flex flex-col items-end">
            <div className="flex flex-col space-y-5 xl:w-4/5 w-full">
              <NavLink
                to="/tell-me"
                className="focus:text-orange-500 xl:text-[16px] text-[12px] flex items-center gap-2 focus:bg-[#ECF2FB] w-full rounded-l-full py-3 px-5"
                activeClassName="bg-[#ECF2FB] text-orange-500"
                onClick={toggleSidebar}
              >
                <GoSearch size={20} />
                <span>{t('tellMe')}</span>
              </NavLink>
            </div>
          </div>

          <div className="flex justify-center w-full">
            <div className="w-3/4 flex border border-dashed border-neutral-400 shadow-inner flex-col space-y-2 rounded-xl p-3 justify-center  bg-[#3D4AE0] ">
              <div className="flex items-center gap-2">
                <img src="assets/phone.png" alt="" width={20} />
                <div>
                  <h1 className="font-bold text-xs">{t('phone')}</h1>
                  <p className="text-xs">+36 30 153 3386</p>
                </div>
              </div>
              <div className="flex items-center gap-2">
                <img src="assets/mail.png" alt="" width={20} />
                <div>
                  <h2 className="font-bold text-xs">{t('email')}</h2>
                  <p className="text-xs">info@development.hu</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> */}
    </div>
  );
};

export default Sidebar;
