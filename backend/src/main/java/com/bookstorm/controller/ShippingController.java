package com.bookstorm.controller;

import com.bookstorm.dto.common.ApiResponse;
import com.bookstorm.dto.shipping.ShippingConfigResponse;
import com.bookstorm.service.ShippingConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/shipping")
@RequiredArgsConstructor
public class ShippingController {

    private final ShippingConfigService shippingConfigService;

    @GetMapping("/config")
    public ResponseEntity<ApiResponse<ShippingConfigResponse>> getShippingConfig() {
        ShippingConfigResponse config = shippingConfigService.getConfig();
        return ResponseEntity.ok(ApiResponse.success(config));
    }
}
