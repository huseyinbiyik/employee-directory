require 'rails_helper'

RSpec.describe Api::V1::EmployeesController, type: :controller do
  describe 'GET #index' do
    before do
      allow(HttpHelper).to receive(:get_employee_list).and_return('{"data": [{"id": 1, "first_name": "John", "last_name": "Doe", "email": "john.doe@example.com", "avatar": "avatar_url"}], "total_pages": 1}')
      get :index, params: { page: 1 }
    end

    it 'calls the HttpHelper to get the employee list' do
      expect(HttpHelper).to have_received(:get_employee_list).with('1')
    end

    it 'creates an employee record for each employee in the response' do
      expect(Employee.count).to eq(1)
      expect(Employee.first).to have_attributes(employee_id: 1, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', avatar: 'avatar_url')
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before do
      allow(HttpHelper).to receive(:get_employee).and_return('{"data": {"id": 1, "first_name": "John", "last_name": "Doe", "email": "john.doe@example.com", "avatar": "avatar_url"}}')
      get :show, params: { id: 1 }
    end

    it 'calls the HttpHelper to get the employee' do
      expect(HttpHelper).to have_received(:get_employee).with('1')
    end

    it 'creates an employee record for the employee in the response' do
      expect(Employee.count).to eq(1)
      expect(Employee.first).to have_attributes(employee_id: 1, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', avatar: 'avatar_url')
    end

    it 'returns a 200 status code and the employee data in the response' do
      expect(response).to have_http_status(:ok)
    end
  end
end
