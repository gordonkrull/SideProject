package org.gordonkrull.kotlin.sideproject.controllers

import org.gordonkrull.kotlin.sideproject.models.Coordinate
import org.gordonkrull.kotlin.sideproject.models.Event
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 * Created by gordonkrull on 2017-10-03.
 */

@RestController
@RequestMapping("/api")
class EventsController {

    @GetMapping("/events")
    fun getEvents() : Event {
        return Event(
                Coordinate(37.7577627, -122.4726194),
                "Test Event",
                "Test Subtitle"
        )
    }
}