import api from './api';

const shippingService = {
  getConfig: () => api.get('/shipping/config'),
};

export default shippingService;
