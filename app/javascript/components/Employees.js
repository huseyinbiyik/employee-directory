import React from "react";
import { useEffect } from "react";
import Pagination from "react-paginate";
import { Link } from "react-router-dom";
import SearchEmployee from "./SearchEmployee";

const Employees = () => {
  const [employees, setEmployees] = React.useState("");
  const [pageCount, setPageCount] = React.useState(0);
  const [currentPage, setCurrentPage] = React.useState(0);

  useEffect(() => {
    fetch(`http://localhost:3000/api/v1/employees?page=${currentPage + 1}`, {
      method: "GET",
    })
      .then((response) => response.json())
      .then((response) => {
        setEmployees(response.data);
        setPageCount(response.total_pages);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [currentPage]);

  const handlePageClick = (data) => {
    let selected = data.selected;
    setCurrentPage(selected);
  };

  const searchEmployee = (employee) => {
    setEmployees(employee);
  };
  console.log(employees);

  return (
    <div>
      <h1>Employees</h1>
      <SearchEmployee searchEmployee={searchEmployee} />
      <ul>
        {employees &&
          employees.map((employee) => (
            <li key={employee.id}>
              <Link to={`/employees/${employee.employee_id}`}>
                {employee.first_name} {employee.last_name}
              </Link>
            </li>
          ))}
      </ul>
      <Pagination
        pageCount={pageCount}
        onPageChange={handlePageClick}
        forcePage={currentPage}
      />
    </div>
  );
};

export default Employees;
