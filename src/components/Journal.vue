<template>
  <v-container>
    <div v-if="showJournal">
      <v-row>
        <v-col v-if="tab === 0" cols="4">
          <v-row>
            <v-btn
                color="red"
                dark
                block
                depressed
                outlined
                @click.stop="drawer = !drawer; getPlaces()"
                style="margin-bottom: 20px"
            >
              Search Type
            </v-btn>
            <v-date-picker
                v-model="selectedDate"
                color="red"
                elevation="3"
                full-width
                no-title
                min="2020-05-26"
                max="2021-11-30"
                style="margin: 2px; margin-bottom: 20px"
            />
          </v-row>
          <v-row>
            <v-date-picker
                v-model="selectedDate"
                color="red"
                elevation="3"
                show-adjacent-months
                full-width
                no-title
                type="month"
                min="2020-05-26"
                max="2021-11-30"
                style="margin: 2px"
            />
          </v-row>
        </v-col>
        <v-col v-else-if="tab === 1" cols="4">
          <v-btn
              color="red"
              dark
              block
              depressed
              outlined
              @click.stop="drawer = !drawer; getPlaces()"
              style="margin-bottom: 20px"
          >
            Search Type
          </v-btn>
          <v-card>
            <v-list dense style="margin: 2px; height: 600px; overflow-y:auto">
              <v-list-item v-for="(item, index) in uniquePlaces" :key="index" link @click="getEntriesByPlace(item)">
                <v-list-item-content>
                  <v-list-item-title>{{ item }}</v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-card>
        </v-col>
        <v-col>
          <div style="height: 600px; overflow-y:auto">
            <v-card v-for="(item, index) in matchingEntries" :key="index" style="margin: 2px; margin-bottom: 20px">
              <v-card-title>
                {{ item.displayDate }}
                <v-spacer />
                {{ item.displayWeather }}
              </v-card-title>
              <v-card-subtitle>
                <v-card :elevation="0" :href="'http://maps.apple.com/?q=' + encodeURI(item.displayLocation)" target="_blank">{{ item.displayLocation }}</v-card>
              </v-card-subtitle>
              <v-card-text class="white text--primary">
                <h5>{{ item.text }}</h5>
              </v-card-text>
            </v-card>
          </div>
        </v-col>
      </v-row>
    </div>
    <v-alert
        v-else
        prominent
        type="info"
    >
      <v-row align="center">
        <v-col class="grow">
          You aren't logged in! Please enter the master password on the home screen to gain access to this content.
        </v-col>
      </v-row>
    </v-alert>
    <v-navigation-drawer
        v-model="drawer"
        absolute
        temporary
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Search Type</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item link @click="tab = 0; drawer = false">
          <v-list-item-icon>
            <v-icon>mdi-calendar</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Calendar</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item link @click="tab = 1; drawer = false">
          <v-list-item-icon>
            <v-icon>mdi-map</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>Location</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-container>
</template>

<script>
import json from '@/assets/Journal.json'

export default {
  name: 'Journal',

  data: () => ({
    items: json.entries,
    matchingEntries: [],
    uniquePlaces: [],
    selectedDate: '',
    drawer: false,
    tab: 0
  }),

  methods: {
    print () {
      console.log(this.showJournal)
    },

    fixEntries () {
      for (let i = 0; i < this.items.length; i++) {
        //Text
        this.items[i].text = this.items[i].text.replaceAll('\\','')

        //Date
        let newDate = new Date(this.items[i].creationDate)
        newDate.setHours(newDate.getHours() - 1)
        this.items[i].displayDate = newDate.toLocaleDateString(undefined, { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }) + '  '
            + newDate.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' })

        //Weather
        this.items[i].displayWeather = Math.round(this.items[i].weather.temperatureCelsius * 9 / 5 + 32) + '˚ ' + this.items[i].weather.conditionsDescription

        //Location
        this.items[i].displayLocation = this.items[i].location.placeName + ', ' + this.items[i].location.localityName + ', ' + this.items[i].location.administrativeArea
      }
    },

    getPlaces() {
      for (let i = 0; i < this.items.length; i++) {
        if (!this.uniquePlaces.includes(this.items[i].displayLocation)) {
          this.uniquePlaces.push(this.items[i].displayLocation)
        }
      }

      this.uniquePlaces.sort()
    },

    getEntriesByPlace(place) {
      this.matchingEntries = this.items.filter(item => item.displayLocation === place)
    }
  },

  watch: {
    selectedDate: function () {
      this.matchingEntries = this.items.filter(item => {
        let iteratedDate = new Date(item.creationDate)
        iteratedDate.setHours(iteratedDate.getHours() - 1)

        let targetDate = new Date(this.selectedDate + 'T07:00')

        let compareString = iteratedDate.getFullYear() + '-' + iteratedDate.getMonth() + '-' + iteratedDate.getDate()
        let targetString = targetDate.getFullYear() + '-' + targetDate.getMonth() + '-' + targetDate.getDate()

        return compareString === targetString
      })

      console.log(this.matchingEntries)
    }
  },

  props: {
    showJournal: Boolean
  },

  mounted () {
    this.fixEntries()
    this.getPlaces()
  }
}

/*
  <iframe
      height="450"
      style="border:0"
      loading="lazy"
      allowfullscreen
      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDtG5W9QQHfyzjrnKi8Yc5fZ5rYAw2cqo8&q=Space+Needle,Seattle+WA">
  </iframe>
 */
</script>
