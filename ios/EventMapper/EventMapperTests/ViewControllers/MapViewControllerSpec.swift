//
//  ViewControllerSpec.swift
//  EventMapperTests
//
//  Created by Gordon Krull on 2017-09-28.
//  Copyright © 2017 GK. All rights reserved.
//

import CoreLocation
import Nimble
import Quick

@testable import EventMapper

fileprivate class EventServiceStub: EventService {
    var stubbedEvents: [Event] = []

    func getEvents() -> [Event] {
        return stubbedEvents
    }
}

class MapViewControllerSpec: QuickSpec {
    override func spec() {
        describe("MapViewControllerSpec") {
            var subject: MapViewController!
            var eventServiceStub: EventServiceStub!

            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: Bundle.main)
                subject = storyboard.instantiateInitialViewController()
                    as! MapViewController // swiftlint:disable:this force_cast
                eventServiceStub = EventServiceStub()
                subject.eventService = eventServiceStub
                UIApplication.shared.keyWindow!.rootViewController = subject
            }

            context("viewDidLoad") {
                beforeEach {
                    eventServiceStub.stubbedEvents = [Event(coordinate: CLLocationCoordinate2D(),
                                                            title: "test title",
                                                            subtitle: "test subtitle")]
                    _ = subject.view
                    subject.viewDidLoad()
                }

                it("should fetch and store events from the eventService") {
                    expect(subject.events).to(equal(eventServiceStub.stubbedEvents))
                }
            }

            context("CLLocationManagerDelegate") {
                beforeEach {
                    let location = CLLocation()
                    subject.locationManager(subject.locationManager, didUpdateLocations: [location])
                }
            }

            context("MKMapViewDelegate") {
            }
        }
    }
}
