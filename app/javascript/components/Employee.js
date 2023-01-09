import React from "react";
import { useEffect } from "react";

const Employee = () => {
  const [employee, setEmployee] = React.useState("");
  const id = window.location.pathname.split("/")[2];

  useEffect(() => {
    fetch(`http://localhost:3000/api/v1/employees/${id}`, {
      method: "GET",
    })
      .then((response) => response.json())
      .then((response) => {
        setEmployee(response.employee);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  return (
    <div>
      <img src={employee.avatar} alt={employee.first_name} />
      <h1>
        {employee.first_name} {employee.last_name}
      </h1>
      <p>{employee.email}</p>

      <button onClick={() => window.history.back()}>Back</button>
    </div>
  );
};

export default Employee;
