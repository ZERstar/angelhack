import axios from "axios";
import api from "../config";

export const getUsers = () => {
  return axios.get(`${api.url}/user`);
};

export const getSMEbyIndustry = (industry) => {
  const data = axios.get(`${api.url}/user`);
  // write a function to filter user by industries
  return data.filter((user) => user.industry === industry);
};
