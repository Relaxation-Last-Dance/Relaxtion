package com.smhrd.entity;

import lombok.Data;

@Data
public class SpotifyPlayRequestBody {
    private String context_uri;
    private spo offset;
    private int position_ms;

}
