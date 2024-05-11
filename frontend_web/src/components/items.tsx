import React, { useState, ChangeEvent } from "react";
import { RiEyeFill, RiEyeOffFill } from "react-icons/ri";
import ReactDropdown, { Option } from "react-dropdown";
import Select from "react-select";
import "react-dropdown/style.css";

interface FormInputProps {
    id: string;
    label?: string;
    value: string;
    onChange: (e: ChangeEvent<HTMLInputElement>) => void;
    placeholder: string;
    className?: string;
    required?: boolean;
    type?: "text" | "password";
}
export const FormInput: React.FC<FormInputProps> = ({
    id,
    label,
    value,
    onChange,
    placeholder,
    className,
    required,
    type = "text",
}) => {
    const [showPassword, setShowPassword] = useState(false);

    const togglePasswordVisibility = () => {
        setShowPassword((prevShowPassword) => !prevShowPassword);
    };
    return (
        <div className={`flex flex-col form-input ${className} mb-3`}>
            <label htmlFor={label} className="text-sm">
                {label}
            </label>
            <div className="relative">
                <input
                    type={showPassword ? "text" : type}
                    id={id}
                    value={value}
                    required={required}
                    placeholder={placeholder}
                    onChange={onChange}
                    className="border border-gray-300 rounded-md px-3 py-2 mt-1 xl:w-[23vw] md:w-[35vw] w-full text-sm pr-10"
                />
                {type === "password" && (
                    <button
                        type="button"
                        className="absolute inset-y-0 right-0 px-3 flex items-center bg-transparent focus:outline-none"
                        onClick={togglePasswordVisibility}
                    >
                        {showPassword ? <RiEyeOffFill /> : <RiEyeFill />}
                    </button>
                )}
            </div>
        </div>
    );
};
export const DashboardInput: React.FC<FormInputProps> = ({
    id,
    label,
    value,
    onChange,
    placeholder,
    className,
    required,
    type = "text",
}) => {
    const [showPassword, setShowPassword] = useState(false);

    const togglePasswordVisibility = () => {
        setShowPassword((prevShowPassword) => !prevShowPassword);
    };
    return (
        <div className={`flex flex-col form-input ${className} mb-3`}>
            <label htmlFor={label} className="text-sm font-bold">
                {label}
            </label>
            <div className="relative">
                <input
                    type={showPassword ? "text" : type}
                    id={id}
                    value={value}
                    required={required}
                    placeholder={placeholder}
                    onChange={onChange}
                    className="border border-gray-300 italic rounded-full px-3 py-2 mt-1  w-full text-sm pr-10"
                />
                {type === "password" && (
                    <button
                        type="button"
                        className="absolute inset-y-0 right-0 px-3 flex items-center bg-transparent focus:outline-none"
                        onClick={togglePasswordVisibility}
                    >
                        {showPassword ? <RiEyeOffFill /> : <RiEyeFill />}
                    </button>
                )}
            </div>
        </div>
    );
};
interface FormDropdownProps {
    id: string;
    label?: string;
    value: string;
    onChange: (e: ChangeEvent<HTMLSelectElement>) => void;
    options: { value: string; label: string }[];
    placeholder: string;
    className?: string;
    required?: boolean;
    width?: string;
}

export const FormDropdown: React.FC<FormDropdownProps> = ({
    label,
    value,
    onChange,
    options,
    placeholder,
    className,
    width,
}) => {
    const handleDropdownChange = (selectedOption: Option) => {
        const syntheticEvent = {
            target: {
                value: selectedOption.value,
            },
        } as React.ChangeEvent<HTMLSelectElement>;

        onChange(syntheticEvent);
    };
    return (
        <div className={`flex flex-col form-input ${className} mb-3`}>
            {label && <label className="text-sm font-bold">{label}</label>}
            <ReactDropdown
                options={options}
                value={value}
                onChange={handleDropdownChange}
                placeholder={placeholder}
                className={`border border-gray-200 italic rounded-full mt-1 xl:w-${width ? width : "15vw"
                    } font-light text-[13px]`}
                controlClassName="border-none rounded-full"
                menuClassName="border border-gray-200 italic"
            />
        </div>
    );
};

interface MultiFormDropdownProps {
    id: string;
    label?: string;
    value: string;
    onChange: (e: ChangeEvent<HTMLSelectElement>) => void;
    options: { value: string; label: string }[];
    placeholder: string;
    className?: string;
    required?: boolean;
    width?: string;
}

export const MultiFormDropDown: React.FC<MultiFormDropdownProps> = ({
    label,
    value,
    onChange,
    options,
    placeholder,
    className,
    width,
}) => {
    const handleDropdownChange = (selectedOption: any) => {
        setSelectedOption(selectedOption as any);
        console.log(selectedOption);
        const syntheticEvent = {
            target: {
                value: selectedOption?.map((option: any) => option.value),
            },
        } as React.ChangeEvent<HTMLSelectElement>;
        onChange(syntheticEvent);
    };
    const [selectedOption, setSelectedOption] = useState([] as any);

    return (
        <div className={`flex flex-col form-input ${className} mb-3`}>
            {label && <label className="text-sm font-bold">{label}</label>}
            <Select
                defaultValue={selectedOption}
                isMulti={true}
                onChange={(selectedOption) => {
                    handleDropdownChange(selectedOption as any);
                }}
                placeholder={placeholder}
                styles={{
                    control: (base) => ({
                        ...base,
                        border: "none",
                        borderRadius: "9999px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    menu: (base) => ({
                        ...base,
                        border: "1px solid #E5E7EB",
                        borderRadius: "8px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    option: (provided, state) => ({
                        ...provided,
                        color: state.isSelected ? "black" : "black",
                        padding: 10,
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    multiValue: (base) => ({
                        ...base,
                        backgroundColor: "#F0F4FF",
                        borderRadius: "9999px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                }}
                options={options}
                className={`border border-gray-200 italic rounded-full mt-1 xl:w-${width ? width : "15vw"
                    } font-light text-[13px] `}
            />
        </div>
    );
};

interface SearchAbleFormDropdownProps {
    id: string;
    label?: string;
    value: string;
    onChange: (e: ChangeEvent<HTMLSelectElement>) => void;
    options: { value: string; label: string }[];
    placeholder: string;
    className?: string;
    required?: boolean;
    width?: string;
}

export const SearchAbleDropDown: React.FC<SearchAbleFormDropdownProps> = ({
    label,
    value,
    onChange,
    options,
    placeholder,
    className,
    width,
}) => {
    const handleDropdownChange = (selectedOption: any) => {
        setSelectedOption(selectedOption as any);
        console.log(selectedOption);
        const syntheticEvent = {
            target: {
                value: selectedOption.value,
            },
        } as React.ChangeEvent<HTMLSelectElement>;
        onChange(syntheticEvent);
    };
    const [selectedOption, setSelectedOption] = useState([] as any);

    return (
        <div className={`flex flex-col form-input ${className} mb-3`}>
            {label && <label className="text-sm font-bold">{label}</label>}
            <Select
                defaultValue={selectedOption}
                isMulti={false}
                onChange={(selectedOption) => {
                    handleDropdownChange(selectedOption as any);
                }}
                placeholder={placeholder}
                styles={{
                    control: (base) => ({
                        ...base,
                        border: "none",
                        borderRadius: "9999px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    menu: (base) => ({
                        ...base,
                        border: "1px solid #E5E7EB",
                        borderRadius: "8px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    option: (provided, state) => ({
                        ...provided,
                        color: state.isSelected ? "black" : "black",
                        padding: 10,
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                    multiValue: (base) => ({
                        ...base,
                        backgroundColor: "#F0F4FF",
                        borderRadius: "9999px",
                        fontSize: "13px",
                        fontWeight: "light",
                    }),
                }}
                options={options}
                className={`border border-gray-200 italic rounded-full mt-1 xl:w-${width ? width : "15vw"
                    } font-light text-[13px] `}
            />
        </div>
    );
};

interface FormCheckboxProps {
    id: string;
    label: string;
    onChange: (e: ChangeEvent<HTMLInputElement>) => void;
    className?: string;
}
export const FormCheckbox: React.FC<FormCheckboxProps> = ({
    id,
    label,
    onChange,
    className,
}) => {
    return (
        <div className={`flex items-center ${className} mb-3`}>
            <input
                type="checkbox"
                id={id}
                onChange={onChange}
                className="form-checkbox border-gray-300 text-blue-500 focus:outline-none focus:border-blue-500 h-4 w-4 cursor:pointer"
            />
            <label htmlFor={id} className="ml-2 text-sm ">
                {label}
            </label>
        </div>
    );
};
