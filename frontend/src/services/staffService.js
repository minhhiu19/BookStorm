import api from './api';

const staffService = {
  // Dashboard
  async getDashboardStats() {
    const response = await api.get('/staff/dashboard');
    return response.data;
  },

  // Orders
  async getOrders(page = 0, size = 20, status = null) {
    const params = { page, size };
    if (status) params.status = status;
    const response = await api.get('/staff/orders', { params });
    return response.data;
  },

  async getOrderById(orderCode) {
    const response = await api.get(`/staff/orders/${orderCode}`);
    return response.data;
  },

  async updateOrderStatus(orderCode, status) {
    const response = await api.put(`/staff/orders/${orderCode}/status`, { status });
    return response.data;
  },

  // Books (Inventory)
  async getBooks(page = 0, size = 20, sort = 'createdAt,desc') {
    const response = await api.get('/staff/books', {
      params: { page, size, sort },
    });
    return response.data;
  },

  async getBookById(id) {
    const response = await api.get(`/staff/books/${id}`);
    return response.data;
  },

  async updateBook(id, data) {
    const response = await api.put(`/staff/books/${id}`, data);
    return response.data;
  },

  async updateBookStock(id, stockQuantity) {
    const response = await api.put(`/staff/books/${id}/stock`, { stockQuantity });
    return response.data;
  },

  // Returns
  async getReturnRequests(page = 0, size = 20, status = null) {
    const params = { page, size };
    if (status) params.status = status;
    const response = await api.get('/staff/returns', { params });
    return response.data;
  },

  async processReturn(id, approved, refundAmount, processNote) {
    const response = await api.put(`/staff/returns/${id}/process`, { approved, refundAmount, processNote });
    return response.data;
  },

  // Shipping (order operations only, no fee config)
  async getShippingByOrder(orderCode) {
    const response = await api.get(`/staff/shipping/order/${orderCode}`);
    return response.data;
  },

  async createShipping(orderCode, data) {
    const response = await api.post(`/staff/shipping/order/${orderCode}`, data);
    return response.data;
  },

  async updateShippingStatus(id, data) {
    const response = await api.put(`/staff/shipping/${id}/status`, data);
    return response.data;
  },

  // Support
  async getSupportOrders(page = 0, size = 20, search = '') {
    const params = { page, size };
    if (search) params.search = search;
    const response = await api.get('/staff/support/orders', { params });
    return response.data;
  },
};

export default staffService;
