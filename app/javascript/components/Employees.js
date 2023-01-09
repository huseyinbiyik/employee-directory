import React from "react";
import { useEffect } from "react";
import Pagination from "react-paginate";
import { Link } from "react-router-dom";

const Employees = () => {
  const [employees, setEmployees] = React.useState([]);
  const [pageCount, setPageCount] = React.useState(0);
  const [currentPage, setCurrentPage] = React.useState(0);

  useEffect(() => {
    fetch(`https://reqres.in/api/users?page=${currentPage + 1}`, {
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

  return (
    <div>
      <Pagination
        pageCount={pageCount}
        onPageChange={handlePageClick}
        forcePage={currentPage}
      />
      {employees.map((employee) => (
        <div key={employee.id}>
          <Link to={`employee/${employee.employee_id}`}>
            <p>
              {employee.first_name} {employee.last_name}
            </p>
            <p>{employee.email}</p>
          </Link>
        </div>
      ))}
    </div>
  );
};

export default Employees;
