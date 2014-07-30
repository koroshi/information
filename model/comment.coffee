schema = new Schema
  title: {type: String, default :''}
  addedTime: {type:Date, default : new Date()}
  status: {type:Number, default :0}

  information: {type:Schema.ObjectId, ref :'Information'}
  user :{ type: Schema.ObjectId, ref: 'User' }

module.exports = Comment = mongoose.model('Comment', schema, 'comment')