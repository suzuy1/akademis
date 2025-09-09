<template>
  <div>
    <h1>Edit Student</h1>
    <form @submit.prevent="updateStudent">
      <input v-model="student.nim" placeholder="NIM" />
      <input v-model="student.name" placeholder="Name" />
      <input v-model="student.jurusan" placeholder="Jurusan" />
      <input v-model="student.tahun" type="number" placeholder="Tahun" />
      <textarea v-model="student.alamat" placeholder="Alamat"></textarea>
      <button type="submit">Update Student</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const route = useRoute()
const student = ref({
  nim: '',
  name: '',
  jurusan: '',
  tahun: null,
  alamat: ''
})

const getStudent = async () => {
  const { data, error } = await supabase.from('students').select('*').eq('id', route.params.id).single()
  if (error) {
    console.error(error)
  } else {
    student.value = data
  }
}

const updateStudent = async () => {
  const { data, error } = await supabase.from('students').update(student.value).eq('id', route.params.id)
  if (error) {
    console.error(error)
  } else {
    router.push('/students')
  }
}

getStudent()
</script>
