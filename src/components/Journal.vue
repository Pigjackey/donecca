<template>
  <v-container>
    <div v-if="showJournal">
      <v-row>
        <v-col cols="4">
          <v-row>
            <v-col>
              <v-date-picker
                  v-model="selectedDate"
                  color="red"
                  elevation="3"
                  full-width
                  no-title
                  min="2020-05-26"
                  max="2021-11-30"
              />
            </v-col>
          </v-row>
          <v-row>
            <v-col>
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
              />
            </v-col>
          </v-row>
        </v-col>
        <v-col>
          <v-row>
            <v-col>
              <v-card>
                <v-card-title>
                  {{ currentEntryDate() }}
                  <v-spacer />
                  {{ currentEntryWeather() }}
                </v-card-title>
                <v-card-subtitle>
                  <v-card :elevation="0" :href="'https://www.google.com/maps/place/' + currentEntryLocation()" target="_blank">{{ currentEntryLocation() }}</v-card>
                  <v-card :elevation="0" :href="'http://maps.apple.com/?q=' + encodeURI(currentEntryLocation())" target="_blank">{{ currentEntryLocation() }}</v-card>
                </v-card-subtitle>
                <v-card-text class="white text--primary">
                  <h5>{{ currentEntryText() }}</h5>
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
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
  </v-container>
</template>

<script>
import json from '@/assets/Journal.json'

export default {
  name: 'Journal',

  data: () => ({
    items: json.entries,
    selectedDate: ''
  }),

  methods: {
    print () {
      console.log(this.showJournal)
    },

    fixText () {
      for (let i = 0; i < this.items.length; i++) {
        this.items[i].text = this.items[i].text.replaceAll('\\','')
      }
    },

    openMaps (address) {
      window.open('https://www.google.com/maps/place/' + address, '_blank')
    },

    currentEntryText () {
      let foundEntry = undefined

      this.items.forEach(item => {
        let iteratedDate = new Date(item.creationDate)
        iteratedDate.setHours(iteratedDate.getHours() - 1)

        let targetDate = new Date(this.selectedDate + 'T07:00')

        let compareString = iteratedDate.getFullYear() + '-' + iteratedDate.getMonth() + '-' + iteratedDate.getDate()
        let targetString = targetDate.getFullYear() + '-' + targetDate.getMonth() + '-' + targetDate.getDate()

        if (compareString === targetString) {
          foundEntry = item
        }
      })

      return foundEntry ? foundEntry.text : ''
    },
    currentEntryLocation () {
      let foundEntry = undefined

      this.items.forEach(item => {
        let iteratedDate = new Date(item.creationDate)
        iteratedDate.setHours(iteratedDate.getHours() - 1)

        let targetDate = new Date(this.selectedDate + 'T07:00')

        let compareString = iteratedDate.getFullYear() + '-' + iteratedDate.getMonth() + '-' + iteratedDate.getDate()
        let targetString = targetDate.getFullYear() + '-' + targetDate.getMonth() + '-' + targetDate.getDate()

        if (compareString === targetString) {
          foundEntry = item
        }
      })

      return foundEntry ? foundEntry.location.placeName + ', ' + foundEntry.location.localityName + ', ' + foundEntry.location.administrativeArea : ''
    },
    currentEntryWeather () {
      let foundEntry = undefined

      this.items.forEach(item => {
        let iteratedDate = new Date(item.creationDate)
        iteratedDate.setHours(iteratedDate.getHours() - 1)

        let targetDate = new Date(this.selectedDate + 'T07:00')

        let compareString = iteratedDate.getFullYear() + '-' + iteratedDate.getMonth() + '-' + iteratedDate.getDate()
        let targetString = targetDate.getFullYear() + '-' + targetDate.getMonth() + '-' + targetDate.getDate()

        if (compareString === targetString) {
          foundEntry = item
        }
      })

      return foundEntry ? Math.round(foundEntry.weather.temperatureCelsius * 9 / 5 + 32) + '˚ ' + foundEntry.weather.conditionsDescription : ''
    },
    currentEntryDate () {
      let foundEntry = undefined

      this.items.forEach(item => {
        let iteratedDate = new Date(item.creationDate)
        iteratedDate.setHours(iteratedDate.getHours() - 1)

        let targetDate = new Date(this.selectedDate + 'T07:00')

        let compareString = iteratedDate.getFullYear() + '-' + iteratedDate.getMonth() + '-' + iteratedDate.getDate()
        let targetString = targetDate.getFullYear() + '-' + targetDate.getMonth() + '-' + targetDate.getDate()

        if (compareString === targetString) {
          foundEntry = iteratedDate
        }
      })

      return foundEntry ? foundEntry.toLocaleDateString(undefined, { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }) + ' ' + foundEntry.toLocaleTimeString() : ''
    }
  },

  props: {
    showJournal: Boolean
  },

  mounted () {
    this.fixText()
  }
}
</script>
