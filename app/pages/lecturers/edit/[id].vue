<template>
  <div>
    <h1>Edit Lecturer</h1>
    <form @submit.prevent="updateLecturer">
      <input v-model="lecturer.nip" placeholder="NIP" />
      <input v-model="lecturer.name" placeholder="Name" />
      <input v-model="lecturer.departemen" placeholder="Departemen" />
      <button type="submit">Update Lecturer</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const route = useRoute()
const lecturer = ref({
  nip: '',
  name: '',
  departemen: ''
})

const getLecturer = async () => {
  const { data, error } = await supabase.from('lecturers').select('*').eq('id', route.params.id).single()
  if (error) {
    console.error(error)
  } else {
    lecturer.value = data
  }
}

const updateLecturer = async () => {
  const { data, error } = await supabase.from('lecturers').update(lecturer.value).eq('id', route.params.id)
  if (error) {
    console.error(error)
  } else {
    router.push('/lecturers')
  }
}

getLecturer()
</script>
