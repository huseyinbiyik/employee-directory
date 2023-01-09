module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        response_body = HttpHelper.get_employee_list(params[:page])
        parsed_response = JSON.parse(response_body)
        create_employee_records(parsed_response['data'])
        @employees = Employee.all
        render json: { status: 200, data: @employees, total_pages: parsed_response['total_pages'] }
      end

      def show
        response_body = HttpHelper.get_employee(params[:id])
        parsed_response = JSON.parse(response_body)
        create_employee_record(parsed_response['data'])
        @employee = Employee.last
        render json: { status: 200, employee: @employee }
      end

      def search
        response_body = HttpHelper.search_employees
        parsed_response = JSON.parse(response_body)
        create_employee_records(parsed_response['data'])
        @employees = Employee.where('email LIKE ?', "%#{params[:email]}%")
        render json: { status: 200, data: @employees }
      end

      private

      def create_employee_records(data)
        Employee.delete_all
        data.each do |e|
          Employee.create(
            employee_id: e['id'],
            first_name: e['first_name'],
            last_name: e['last_name'],
            email: e['email'],
            avatar: e['avatar']
          )
        end
      end

      def create_employee_record(data)
        Employee.delete_all
        Employee.create(
          employee_id: data['id'],
          first_name: data['first_name'],
          last_name: data['last_name'],
          email: data['email'],
          avatar: data['avatar']
        )
      end
    end
  end
end
