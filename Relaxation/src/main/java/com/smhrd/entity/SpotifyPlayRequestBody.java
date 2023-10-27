package com.smhrd.entity;

import lombok.Data;

@Data
public class SpotifyPlayRequestBody {
    private String context_uri;
    private Offset offset;
    private int position_ms;

}
