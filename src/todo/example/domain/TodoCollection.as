package todo.example.domain
{
	import flash.geom.Vector3D;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	import todo.example.domain.api.ITodoCollection;

	public class TodoCollection implements ITodoCollection
	{
		private var _source: Vector.<Todo>;
		
		private var _changedSignal: Signal = new Signal();
		
		/**
		 * Dispatched when the collection is
		 * changed.
		 */
		public function get changedSignal(): ISignal
		{
			return _changedSignal;
		}
		
		/**
		 * Returns the number of todos in the
		 * collection.
		 */
		public function get length(): Number
		{
			return _source.length;
		}
		
		public function TodoCollection()
		{
			_source = new Vector.<Todo>();	
		}
		
		/**
		 * Adds a new Todo item to the collection.
		 */
		public function add(todo: Todo): void
		{
			_source.push(todo);
			_changedSignal.dispatch();
		}
		
		/**
		 * Returns all the todo items so that we
		 * can loop over the items.
		 */
		public function all(): Vector.<Todo>
		{
			return _source;
		}
	}
}