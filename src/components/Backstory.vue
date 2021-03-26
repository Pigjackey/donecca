<template>
  <v-container>
    <v-timeline :reverse="false" :dense="$vuetify.breakpoint.smAndDown">
      <v-timeline-item
          v-for="(item) in items"
          :key="item"
      >
        <template v-slot:opposite>
          <span
              :class="`headline font-weight-bold ${item.color}--text`"
              v-text="new Date(item.creationDate).toDateString()"
          ></span>
        </template>
        <v-card>
          <v-card-text class="white text--primary">
            <p class="pt-2">{{ item.text }}</p>
          </v-card-text>
        </v-card>
      </v-timeline-item>
    </v-timeline>
  </v-container>
</template>

<script>
import json from '@/assets/Journal.json'
export default {
  name: 'Timeline',

  data: () => ({
    items: json.entries
  }),

  methods: {
    print (item) {
      console.log(item)
    },

    fixText () {
      for (let i = 0; i < this.items.length; i++) {
        this.items[i].text = this.items[i].text.replaceAll('\\','')
      }
    }
  },

  mounted () {
    this.fixText()
  }
}
</script>
