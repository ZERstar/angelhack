import axios from "axios";
import api from "../config";

export const checkEligibility = (id) => {
  return axios.post(`${api.url}/loanapp/check-eligibility/${id}`)
};

export const assessRisk = (id) => {
  return axios.post(`${api.url}/loanapp/assess-risk/${id}`)
};

export const getloanApplication = () => {
  return axios.get(`${api.url}/loanapp`)
};

export const getInstallments = (id) => {
  return axios.get(`${api.url}/loanapp/installments/${id}`)
};