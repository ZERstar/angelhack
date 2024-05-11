import React, { useState, useEffect } from "react";
import { FormInput } from "../../components/items";

const SignIn = ({ setIsAuth }) => {
    console.log("signin")
    const [form, setForm] = useState({
        email: "",
        password: "",
    });
    const handleLogin = async (e) => {
        e.preventDefault();

        if (form.email === "" || form.password === "") {
            console.log("empty");
        }
        else {

            try {
                let payload = {
                    email: form.email,
                    password: form.password,
                };

                if (payload.email == "Admin" && payload.password == "Admin") {
                    localStorage.setItem("token", "jwtToken");
                    setIsAuth(true);
                } else {
                    toast.error("Invalid email or password. Retry!");
                }
            } catch (error) {

                console.log(error);
            }
        }

    };
    useEffect(() => {
        if (localStorage.getItem("token")) {
            setIsAuth(true);
        }
    }, []);

    return (
        <>

            <div className="md:flex h-screen w-full">
                <div className=" hidden bg-[#4F5AF5] md:w-1/2 h-full md:flex items-center justify-center">
                    <img src="assets/logoSignup.png" alt="Saadhan" width={480} />
                </div>
                <div className="md:bg-[#4F5AF5] md:w-1/2  h-screen flex flex-col justify-center items-center">
                    <div className="bg-white md:border md:rounded-l-[40px] md:w-full h-screen flex flex-col justify-center items-center ">
                        <div className="text-left space-y-12">
                            <h1 className="text-4xl font-semibold">Welcome back!</h1>
                            <form onSubmit={handleLogin}>
                                <FormInput
                                    id="email"
                                    value={form.email}
                                    placeholder="Enter Email"
                                    onChange={(e) => { setForm((form) => ({ ...form, email: e.target.value })) }}
                                    required
                                />
                                <FormInput
                                    type="password"
                                    id="password"
                                    value={form.password}
                                    placeholder="Enter Password"
                                    onChange={(e) => { setForm((form) => ({ ...form, password: e.target.value })) }}
                                    required
                                />
                                <button
                                    type="submit"
                                    className="bg-[#4F5AF5] text-white text-center py-2.5 rounded-full w-full font-bold mt-5"
                                >
                                    logIn
                                </button>
                            </form>

                        </div>
                    </div>
                </div>

            </div>
        </>
    );
};

export default SignIn;
