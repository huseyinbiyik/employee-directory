import React from "react";

const SearchEmployee = ({ searchEmployee }) => {
  const [employees, setEmployees] = React.useState("");
  const handleChanges = (e) => {
    e.preventDefault();
    fetch(
      `http://localhost:3000/api/v1/employees/search?email=${e.target.value}`,
      {
        method: "GET",
      }
    )
      .then((response) => response.json())
      .then((response) => {
        setEmployees(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <div>
      <input
        type="text"
        name="search"
        placeholder="Search by email"
        onChange={handleChanges}
      />
      
      {searchEmployee(employees)}
    </div>
  );
};

export default SearchEmployee;
