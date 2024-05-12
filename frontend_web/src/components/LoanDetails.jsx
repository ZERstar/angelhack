
import axios from "axios";
import React, { useRef, useState, useEffect } from "react";
import api from "../config";

const HomeModal = ({ title, onClose, loanData }) => {
    const [risk, setRisk] = useState(0)
    if (loanData.risk_percentage != 0) {
        setRisk(loanData.risk_percentage)
    }

    const modalRef = useRef(null);
    console.log(loanData)
    useEffect(() => {
        const handleOutsideClick = (event) => {
            if (modalRef.current && !modalRef.current.contains(event.target)) {
                onClose();
            }
        };

        document.addEventListener("mousedown", handleOutsideClick);

        return () => {
            document.removeEventListener("mousedown", handleOutsideClick);
        };
    }, [onClose]);

    const screenWidth = window.innerWidth;

    // Define width and height based on screen width
    let width = 500;
    let height = 300;
    if (screenWidth <= 640) {
        // For mobile screens or smaller
        width = 300;
        height = 200;
    }
    const handleApprove = (id) => {

        console.log(id)
        axios.patch(`${api}/loanapp/${id}`, { status: "approved" }).then(res => {
            window.location.reload()
        })
    }
    const handleReject = (id) => {
        axios.patch(`${api}/loanapp/${id}`, { status: "rejected" })
    }
    const handleRisk = (id) => {
        axios.post(`${api}/loanapp/assess-risk/${id}`).then(res => {
            console.log(res.data)
            setRisk(res.data.risk_percentage)
        })
    }
    return (
        <div className="fixed z-10 inset-0 overflow-y-auto">
            <div className="flex items-center justify-center h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                <div className="fixed inset-0 transition-opacity" aria-hidden="true">
                    <div className="absolute inset-0 bg-black opacity-55"></div>
                </div>
                <span className="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                <div ref={modalRef} className="inline-block align-middle bg-white rounded-xl text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:max-w-3xl sm:w-full h-1/2">
                    <div className="flex flex-col items-center justify-evenly text-center h-full">
                        <h3 className="text-lg leading-6 text-gray-900 text-center font-semibold">Loan Approval</h3>
                        <div className="text-center sm:text-left">
                            <div className="flex gap-12">
                                <div className="p-4">
                                    <div>
                                        <span className="font-semibold">Company Name: </span>
                                        <span>{loanData.user.company_name}</span>
                                    </div>
                                    <div className="mt-2">
                                        <span className="font-semibold">Purpose: </span>
                                        <span>{loanData.loan_purpose}</span>
                                    </div>
                                    <div className="mt-2">
                                        <span className="font-semibold">Date: </span>
                                        <span>{loanData.created_at.split("T")[0]}</span>
                                    </div>
                                    <div className="mt-2">
                                        <span className="font-semibold">Amount: </span>
                                        <span>{loanData.loan_amount}</span>
                                    </div>
                                </div>

                                <div>
                                    <div className="grid grid-cols-2 gap-4">
                                        {risk != 0 ?
                                            (
                                                <>
                                                    <div className="p-4">
                                                        <div>
                                                            <span className="font-semibold">Risk: </span>
                                                            <span>{risk.toFixed(2)}%</span>
                                                        </div>
                                                    </div>

                                                </>
                                            )
                                            :
                                            (

                                                < button onClick={(e) => { e.preventDefault(); handleRisk(loanData._id) }} className="bg-[#FFC145] hover:bg-gray-700 text-black font-bold py-2 px-4 rounded">
                                                    Check Risk
                                                </button>
                                            )

                                        }
                                        <button onClick={onClose} className="border border-[#FFC145] hover:bg-blue-700 text-black font-bold py-2 px-4 rounded">
                                            Check Eligibility
                                        </button>
                                        <button onClick={(e) => { e.preventDefault(); handleApprove(loanData._id) }} disabled={loanData.status === "pending" ? false : true} className="bg-[#2BCC7F] hover:bg-blue-700 text-black font-bold py-2 px-4 rounded disabled:bg-[#caf5e0]">
                                            Approve
                                        </button>
                                        <button onClick={(e) => { e.preventDefault(); handleReject(loanData._id) }} disabled={loanData.status === "pending" ? false : true} className="bg-gray-500 hover:bg-gray-700 text-black font-bold py-2 px-4 rounded disabled:bg-gray-200">
                                            Reject
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div >
    );
};

export default HomeModal;
// const LoanDetails = (loanData) => {
//     return (
//         <>
//             <div className="text-3xl font-semibold">
//                 Loan Approval
//             </div>

//             <div className="relative w-[700px] max-w-full h-[378px] text-left text-base text-black font-montserrat rounded-lg shadow-md bg-white flex ">
//                 {/* Company Details */}
//                 <div className="p-4">
//                     <div>
//                         <span className="font-semibold">Company Name: </span>
//                         <span></span>
//                     </div>
//                     <div className="mt-2">
//                         <span className="font-semibold">Loan Name: </span>
//                         <span>Vendor Finance</span>
//                     </div>
//                     <div className="mt-2">
//                         <span className="font-semibold">Purpose: </span>
//                         <span>Hiring more vendors.</span>
//                     </div>
//                     <div className="mt-2">
//                         <span className="font-semibold">Date: </span>
//                         <span>September 9, 2013</span>
//                     </div>
//                     <div className="mt-2">
//                         <span className="font-semibold">Amount: </span>
//                         <span>Rs. 10 Lakhs</span>
//                     </div>
//                 </div>

//                 {/* Loan Approval Text */}


//                 {/* Separator Line */}
//                 <div className="   w-1 h-[285px] border-r-[4px] border-solid border-steelblue" />

//                 {/* Approval Stages */}
//                 <div className="text-xs text-darkslategray">
//                     <div className="  w-72 h-[90.5px]">
//                         {/* Stage 1: Eligibility Check */}
//                         <div className=" left-1 w-full h-[36.5px]">
//                             <div className=" left-0 rounded-lg border-2 border-solid border-goldenrod w-full h-full" />
//                         </div>
//                         <div className="  left-16.3 font-semibold">Eligibility Check</div>

//                         {/* Stage 2: Risk Analysis */}
//                         <div className="  left-154 w-full h-[36.5px]">
//                             <div className=" rounded-lg bg-goldenrod w-full h-full" />
//                         </div>
//                         <div className="  font-semibold">Risk Analysis</div>

//                         {/* Stage 3: Approval */}
//                         <div className="  w-full h-[36.5px]">
//                             <div className="  rounded-lg bg-mediumseagreen w-full h-full" />
//                         </div>
//                         <div className="  font-semibold">Accept</div>

//                         {/* Stage 4: Reject */}
//                         <div className="  w-full h-[36.5px]">
//                             <div className=" rounded-lg border-2 border-solid border-firebrick w-full h-full" />
//                         </div>
//                         <div className=" font-semibold">Reject</div>
//                     </div>
//                 </div>

//                 {/* Image */}
//                 <img
//                     className=" w-[179px] h-[90.7px]"
//                     alt=""
//                     src="/group-314.svg"
//                 />
//             </div>
//         </>
//     );
// };

// export default LoanDetails;
