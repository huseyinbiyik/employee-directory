import React from "react";
import { useEffect } from "react";

const Employee = () => {
  const [employee, setEmployee] = React.useState("");

  useEffect(() => {
    fetch(`http://localhost:3000/api/v1/employees/${id}`, {
      method: "GET",
    })
      .then((response) => response.json())
      .then((response) => {
        setEmployee(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  return (
    <div>
      <h1>
        {employee.first_name} {employee.last_name}
      </h1>
      <p>{employee.email}</p>
    </div>
  );
};
