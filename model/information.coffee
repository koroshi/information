schema = new Schema
  title: {type: String, default :''}
  content: {type:String, default : ''}
  addedTime:{type:Date, default : new Date()}
  status: {type:Number, default :0}

  user : { type: Schema.ObjectId, ref: 'User' }

module.exports = Information = mongoose.model('Information', schema, 'information')