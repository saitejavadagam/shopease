import { Suspense } from 'react'
import Loader from './Loader'

const SuspenseLoader = ({ message, children }) => {
    return (
        <Suspense fallback={<Loader message={message} />}>
            {children}
        </Suspense>
    )
}

export default SuspenseLoader