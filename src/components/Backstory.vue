<template>
  <v-container>
    <div v-if="showJournal">
      <v-row>
        <v-col>
          <v-date-picker
              v-model="selectedDate"
              color="red"
              elevation="10"
              show-adjacent-months
              scrollable
              full-width
              no-title
              type="month"
              min="2020-05-26"
              max="2021-11-30"
          />
        </v-col>
        <v-col>
          <v-date-picker
              v-model="selectedDate"
              color="red"
              elevation="10"
              full-width
              no-title
              min="2020-05-26"
              max="2021-11-30"
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card>
            <v-card-text class="white text--primary">
              <p class="pt-2">{{ currentEntryText() }}</p>
            </v-card-text>
          </v-card>
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
  name: 'Timeline',

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

    currentEntryText () {
      let foundEntry = undefined
      this.items.forEach(item => {
        if (new Date(item.creationDate)
            .toLocaleDateString('zh-Hans-CN', { year: 'numeric', month: '2-digit', day: '2-digit' })
            .replaceAll('/','-')
            === this.selectedDate) {
          foundEntry = item
        }
      })
      return foundEntry ? foundEntry.text : ''
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
